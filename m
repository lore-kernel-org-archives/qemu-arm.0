Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09383EF3716
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 08:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzVqn-00067g-RU; Mon, 09 Mar 2026 04:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzVqm-000673-89
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 04:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzVqk-00057N-GJ
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 04:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773044425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FmLlmlYhYuw/T4mShLkZVlsD4E8YWHg2lEg1DR7UflA=;
 b=MQi8SCUdD5Nb/vyp1k+IbSolWbKlKFsHsV0JwYtEgue0tdkM2Cs3OVakOck8sA1HStEO3B
 MBdwQ4a77rJwa8IVUPXtHUSaHRvQpzV+i3QQqTujyvkSV+0u64c43POyYJcfMnr6+DdSt3
 eC6JbiKsOL4EkffCebJl/sJ2dQmMY38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-FNHYGhdtOtqFmByXS7kn9w-1; Mon, 09 Mar 2026 04:20:22 -0400
X-MC-Unique: FNHYGhdtOtqFmByXS7kn9w-1
X-Mimecast-MFC-AGG-ID: FNHYGhdtOtqFmByXS7kn9w_1773044421
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-439b8858b0cso6303442f8f.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 01:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773044421; x=1773649221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmLlmlYhYuw/T4mShLkZVlsD4E8YWHg2lEg1DR7UflA=;
 b=Ikf6ks+cKxNAHwZsZ4ZElB90tm8/E2De49c0dvREWoE+8b1+cTnvQPR6xktHYKR30H
 RwvSJ0Re62W61DqxFntGzhGp/yZTpeRFF3J6Nd83r8Ry86boq5bPuK0VfejI8iUXbvlh
 eyCANUsarjwvfMpAR+8l+ZyU/JtrO6gLQGhpMyKPs4OQPQeXqq7jL8mTqAsmZCeSxBZ0
 BaYW3CKCrUGXsVRdU7ebjNobb9opOGcDzNoqgGaACclUepRygmaqsS4FQIvxZdx/lNUl
 dSEoe5hbvB1V5jlU5p7w8KcSDWplM663GrmHCvxLs0LBFyDhcpn96xphiHSUycMVLWrD
 VHWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTwDk/j89NsEWbrl561NDIw/jJ0jAr6jz1KgW8RABs+uYXmBozrQ04zm2f1EyF9z9/4ZeLq1GilQ==@nongnu.org
X-Gm-Message-State: AOJu0YwszoTU3RQrKnyPmvbpx3uJcYM96dcHIz+i7QzZ6FrfjH+ScqHP
 TIdcI1RXTcY3mnmP/qeCzabxq2FHgHowYP+zLb7dNmVlKvozOLJgk/L0tWw6dfEHJrohqu/GqtY
 LeMfFmLEQyCelMkklShXCk5aNN8YEsAw8oqQu1+ltW79juhFS3NIUL/3SwE4ZmkT22TPjOjBsTb
 K7Mpq9akdKJORw+Qw/Br/NUQBPXsfw
X-Gm-Gg: ATEYQzyT8Qmpy1VaZeZqoEOGzGnqnRpb9XYtVUlnUAdlA+wa//mPOxOokvIyDct4ZrW
 9I0+hg1ZzgjrQmsSWIVS3sFsZbJFBaVVII8OirrsLp2srWPAveFjQt537hGP4p/OAG64kWiIl/6
 lUd4hi7AS6WO66lPjsKJFEwL+lPcqUX6ISUnODnW2T2YfIFa1ucvdDcDXsyx1aVc8IToiYpIuHN
 cYhoxY2mt8vS4oEUxDks20vSBcEyNOdTM4mzctAFkqa5CiuKw7FmWdO3emHF5DkEilRQ/frUJ+g
 1v7yn0A=
X-Received: by 2002:a05:6000:2dca:b0:439:b046:2044 with SMTP id
 ffacd0b85a97d-439da354a8emr19401404f8f.12.1773044421368; 
 Mon, 09 Mar 2026 01:20:21 -0700 (PDT)
X-Received: by 2002:a05:6000:2dca:b0:439:b046:2044 with SMTP id
 ffacd0b85a97d-439da354a8emr19401362f8f.12.1773044420884; Mon, 09 Mar 2026
 01:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260307181856.2209-1-mohamed@unpredictable.fr>
 <20260307181856.2209-3-mohamed@unpredictable.fr>
In-Reply-To: <20260307181856.2209-3-mohamed@unpredictable.fr>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 9 Mar 2026 09:20:09 +0100
X-Gm-Features: AaiRm527i9QEo9DghNOF5yg_dWiPZSNKtlGN03joRAyLolyXS0kg5dzXD619DRM
Message-ID: <CABgObfZqDHL=kkto8i5VdpO+mEOfeZ9vYSMmVnS+T4cwNekzzA@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] meson.build: older macOS targeting compatibility
 with macOS 15.4 SDK
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Wei Liu <wei.liu@kernel.org>, Roman Bolshakov <rbolshakov@ddn.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Pedro Barbuda <pbarbuda@microsoft.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jq2oCxSkKATR9rITKLuYQDzXhHqtmn4BJE6QAEKYZkU_1773044421
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On 3/7/26 19:18, Mohamed Mediouni wrote:
> Using strchrnul eagerly results in a failure to compile when using the newest SDKs, with:
>
> error: 'strchrnul' is only available on macOS 15.4 or newer [-Werror,-Wunguarded-availability-new]
>
> Working around that by not using strchrnul when targeting macOS.
>
> This didn't show up on the CI because it used the macOS 15.1 SDK instead of a macOS 15.4 SDK or later.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   meson.build | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 7b4e5bc72b..78bde0611b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2646,7 +2646,12 @@ config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
>   config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
>   config_host_data.set('HAVE_GLIB_WITH_SLICE_ALLOCATOR', glib_has_gslice)
>   config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
> -config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul', prefix: osdep_prefix))
> +
> +# strchrnul was introduced in macOS 15.4.
> +# Keep this condition for compatibility of new macOS SDKs with older releases.
> +if host_os != 'darwin'
> +  config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul', prefix: osdep_prefix))
> +endif

Is -Wunguarded-availability-new enabled by default?  If it is enough to
shut up the compiler maybe you can add a -mmacosx-version-min= flag, but
workarounds on each function are not acceptable.

I'm applying the other patches, but for this one I don't think this is
the right fix.


Paolo


