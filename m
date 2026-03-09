Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE0AEFCD93
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 11:17:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzYbu-0004Ux-Cq; Mon, 09 Mar 2026 07:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzYbe-0004SW-Dk
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 07:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzYbc-0005Ld-Ge
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773055019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMRWNj22r8FDh1jIngNjeJbyrmVNdMjDt/5/9aMrxfM=;
 b=dB2bk60D1tiYuxISHAMchadby6US9wSo0ZZGxWrjnRhm9kB8JUdO1jt0KJoX9gL1j/KXi5
 dx5iCjfiBYIuLVdbR9ahrSCI4CvH1nilhpcbXynyMLFEMAcDeu7fJA9ShUsRIHt/SbLkrZ
 hid+jDgbhX6VqNGr9RG+WG53Th9rjUo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-lciLMEwNNHCWzcxonts-0Q-1; Mon, 09 Mar 2026 07:16:58 -0400
X-MC-Unique: lciLMEwNNHCWzcxonts-0Q-1
X-Mimecast-MFC-AGG-ID: lciLMEwNNHCWzcxonts-0Q_1773055017
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439b50dfca1so6210586f8f.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 04:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773055017; x=1773659817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tMRWNj22r8FDh1jIngNjeJbyrmVNdMjDt/5/9aMrxfM=;
 b=HPHES9YeSLFc7iWkxGPeRkbi55mpJI3A7t+v7/AXi6P5g6R1g2qmsTsCUWtEXjzSoh
 NhcKFZse21l2e25HlcoaGzNHr3HzyzG00EnOU3cKM1iFyedyAxjliG3s9Emfa0IC90z8
 A6G6YT08fE6jc3HktSrf7ysAGeaFCdcp671SinIPGZ+XP1pbxLle2JWMgYQzzivet427
 5o/ZKeXhrl2WcpPnS0kzQwkCdV5OYOeiC45IZG3UB9YKrNR0l5qB4akLVlI9KaGU+Eut
 7ND09GLBZ8B9A1FeG67/Axr7fTOqBo0b/R2sqeXEd7wNP4TiPL35pWxkyk+RGu0IZS2t
 9Blw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRk2Km1JjPRlBSEddrgydgpnDhkLhAhAIp+qQ9LQKVCb4JmqsOrd5+/9c+WssQRZ1PJJH+eRw2Bg==@nongnu.org
X-Gm-Message-State: AOJu0YzrK535xO+9lEnj/qXGLn0I0N79SdMi0LuZXedQtGCGvNNCmTNq
 af33bIcGMheo/3SUtzTVAM+MEYeGmPCQomdMRQcLdpMCiicV85f13NN3d80V0vwrnrik+zEjTAk
 XtvD/bh/O5uQo2y6HslRvkbls091JJiIfz/WVY9wVno8SJMNZEJvdBlBEfdICaL3yq5+4N3U/Eg
 3MgwT8nGFnEVvdLjdLHBbjE0RhzSCT
X-Gm-Gg: ATEYQzwJGBvq0+rFZD71eEKUDOUTzvZBXBpP4VWOM73DlldkniRjT90YHC45qm3bOvR
 UEIlL4XbEYxl8CPAjpdGhliWvghP1fO/53+uNTR73/eRmz8/8+g0b5+/9LruiTgMsblQ8lD29iq
 qp2Lm7ANK/3Hjt3UiSnhE6ECa1S/bvd8QVyR+TSJeplwKWpT4Zf4p41INzhwms8ZEBvQCb0lQ6h
 gba8Vv2F6V3H37HZQRD1nXBvothfz2g5hu5pDrCRoj7JH5ajnD1Qm5LSviCi/o042E5erQfLLYp
 qEwP1gM=
X-Received: by 2002:a05:6000:25c2:b0:439:b788:73a3 with SMTP id
 ffacd0b85a97d-439da552f96mr19215845f8f.49.1773055016639; 
 Mon, 09 Mar 2026 04:16:56 -0700 (PDT)
X-Received: by 2002:a05:6000:25c2:b0:439:b788:73a3 with SMTP id
 ffacd0b85a97d-439da552f96mr19215772f8f.49.1773055016111; Mon, 09 Mar 2026
 04:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260307181856.2209-1-mohamed@unpredictable.fr>
 <20260307181856.2209-3-mohamed@unpredictable.fr>
 <CABgObfZqDHL=kkto8i5VdpO+mEOfeZ9vYSMmVnS+T4cwNekzzA@mail.gmail.com>
 <28C201EE-89A9-4454-8F8A-4FD05B38E132@unpredictable.fr>
In-Reply-To: <28C201EE-89A9-4454-8F8A-4FD05B38E132@unpredictable.fr>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 9 Mar 2026 12:16:44 +0100
X-Gm-Features: AaiRm505qiKL1t8d_eTXuEKNHBQ0bv6N8X2aTEq0gCRv7qRwzTf7bNGrRXZskKw
Message-ID: <CABgObfZX0T1VCetJkTdRv9+9pHxubL8PRA0QDvR5W3chjP+=pA@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] meson.build: older macOS targeting compatibility
 with macOS 15.4 SDK
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Wei Liu <wei.liu@kernel.org>, Roman Bolshakov <rbolshakov@ddn.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Pedro Barbuda <pbarbuda@microsoft.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 36hwucbuh1NfdjG1Pg6XNL4178-4-TXzsH9VIGsf2qU_1773055017
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Mar 9, 2026 at 9:38=E2=80=AFAM Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
> Another way would be to have the has_function have -Werror which should b=
e enough to deal with
> this case properly. Does that sound better?

Yes, if that works it's better. For 11.1 we can look into adding
-Werror to all cc.has_function() calls.

> For meson not sure whether it actually picks up the definition from the h=
eader or tries to use a dummy
> definition though from looking at https://github.com/mesonbuild/meson/blo=
b/6e67be7492d6982d2baf153387f9adbdb480d099/mesonbuild/compilers/mixins/clik=
e.py#L738
> If it picks the definition from the header, having Werror there ought to =
be enough. Otherwise, won=E2=80=99t be caught...

If you have a "#include <>" in the prefix it will pick the declaration:

        if '#include' in prefix:
            head, main =3D self._have_prototype_templ()
        else:
            head, main =3D self._no_prototype_templ()

which is also something that we can add to 11.1.

Paolo


