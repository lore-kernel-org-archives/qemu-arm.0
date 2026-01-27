Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC69D2D8F9
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 11:09:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkgx7-0002Dv-8q; Tue, 27 Jan 2026 06:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgwy-0002CW-Ci
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:09:37 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgwv-0006io-Cc
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:09:36 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-790948758c1so53978417b3.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 03:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769512172; cv=none;
 d=google.com; s=arc-20240605;
 b=f0Io9IWLUOfZjcGpfh75N69Z3AhvJnvaAR46n0EVXC1ZaUu1Opx28PWGvVnbpxubsn
 53mDWydzAW6YvhhEdgptBesuT/dgW9zq3/hJu+c6sISTpiB53c9s33E12IcdTYByV/Ko
 eCV3FZ3Jgh0voZOrKU3yiQ2fFAplC2rXdVsttQrhG778KKmfsvlpbz9amXpkvCsbqqNa
 lvJN0v7XN+MFE3UzKpg2dZXW8/gQvNiYQedFrFqJfkMaEGHRFUdkbfz+OwcJWh/aqHxb
 xbE2s6/wfMhdPaEg8gOXBlJuDeH4WwH8x/DphORY2dfn4jV5QEGa8uPdFiM8KyH97fgY
 VqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mQEb84e7JtMOm0oSuQqUamX2gk5Z99Avs5hmajUOejU=;
 fh=xKkVir5ae1bniKJnvkERp0jOb9NOzEx8+F76rL/fmy4=;
 b=IDlldPoxpQxx1D+bfMNB0aRGR6nGF3FPJWAumrUqgKXYpeuzpPpJ+dNXNUtdiVzfTP
 gHmhRGxT3jdy5yuQHztPIb+LwE4Ogzu0i3YfWK/l3bsKINfqicbmy4JfsmhA+Tj/Dozh
 7VcfLi92BMTc9ylnlg6fOpOffCKxzZG0+34OE0h7KWd2+iVdbj3J0lmTAMclY5GZFLzv
 D33aoW1LJcGpq3JMdGvtTe7jmvKSIeDhGTExCcqP8Ob2IQ1QlK9DHUrxse9tcLSw1bk2
 jEK+vMzHd9fmF+S5hBnzLWSTjMEyDpm/U/0JuVL9App3weX8rJoy5FXmzcthJJChOLH2
 5I/A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769512172; x=1770116972; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mQEb84e7JtMOm0oSuQqUamX2gk5Z99Avs5hmajUOejU=;
 b=LpWzcQy+mAuSj2ZczgeouVO+L6pNLdH3UC3bYzgbhfcXY4VdVWUSWxKYCH9d9JbD7J
 LMHT1LFjp8mazUceTIZB107A8oC12eDvAzasZta2OWL95ZCsWRsdmSbFGkMj8rqtvG4U
 aTmljYiqdMpwu967eZttv0m3BxGiHp3Ohe58SKvN04iCHyDvGv2wRzHNh1pTLliSu/8F
 Soafey5+eGCWvTUSXf8v10d4iIi0h+dNTcM3ZeXtY9FMvz2EXfcK96F4tcdHjurDMA9L
 Nh1TrrnHqbViahW9F8CtcVijFUGsqSX1bJPEAx87NkPZB+T9Xh0fpto+VEBX/M/wLECa
 6t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769512172; x=1770116972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQEb84e7JtMOm0oSuQqUamX2gk5Z99Avs5hmajUOejU=;
 b=GBtt+bYiDb+Au/cKqJdHR9IxQbaCN6hMb4wHnrYSRHC/QqU8pofuDEeFZS9QJqBkVH
 hZ2gvVwuED5xHLl5D5Ga/4o1fh4hVu6gz87RR8hRm/MI12JAzFOTdFmV+rYnnVupAupJ
 Zrgnwlj5k0toLAsNkMa71mg8XGZxfN8ExKYYTboDMEVK6lMgPGIsuYd6KbCPGLH2cddE
 4hl1+xEHlUEunO3I7lBUDXYuAMAH87FS2SO8sXe0e+W8WfBYHjjR72h0alA0muZeVA7P
 KySNDAi6+DD5V2LUk2g5KVhO7cXXWMJPFV+MMiSv2/uA6lZiAtOuG5blzPC8ONh4BxXu
 b19w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURp4MA/l2UL/VTNmXcKPnYEG1VhlGVeDGr4aBwNq4f1tF0cI2P2PGMSJK5AxeT7K0/zh7WGv3u0g==@nongnu.org
X-Gm-Message-State: AOJu0Yxn6vwff07L2k2DVpYU/hiCJbLHPbAp3kar1CQKjT3L5L0uF8BF
 b0cpkrDASSFqbutM9eddoH+CCLvPncVGpMubUvPpZ1cFuqKYY5yyFXA7ZfG45mylT8TPLbWE52m
 i/hqze8nahRHKlNyd9ry/YXwnkd+3NIO071Cw2ypmAg==
X-Gm-Gg: AZuq6aKSL9DbCBrxSh4AZwezPlr86FtU1nLNOVO4vtIlDwa7qccnn9lsQHDgE8+1aQ6
 s6Y/HqnIjtdVVzpZKElZyrycksJ1akhk6rGvEP8zdGztM8a5dE2t3MygUaelBqy4o/Xb1vEZbku
 pWOPuZX526i7StfAkR5Z2I7tNWSLlh1J85RByElnnJ46CCSEBHEq776nUwy9Oe2u5F2mGErmFrE
 IvTYxF6ASc5MTpRj1PHV/eKk35yLLujl87th8+3KlXfIGzke74OFb+EpShw3kdHlLUUsg==
X-Received: by 2002:a05:690c:10d:b0:794:795d:4728 with SMTP id
 00721157ae682-7947aa04204mr8209797b3.23.1769512172088; Tue, 27 Jan 2026
 03:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
In-Reply-To: <20260121134114.9781-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 11:09:20 +0000
X-Gm-Features: AZwV_Qixd0EgnbcgMdIeEVoGMfqvDJPGAc-SR0Geb1PsZtMeX-KI7VhJfc9gmVs
Message-ID: <CAFEAcA9qQB6Cthd5FrFTQRCVuiwAz7J+xBuuE=-vq7ThUpS8Lw@mail.gmail.com>
Subject: Re: [PATCH v17 00/21] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 21 Jan 2026 at 13:41, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v18)
>
> Missing features:
> - VM save-restore: interrupt controller state notably
> - SVE register sync: I didn't have the time to test this on pre-release hardware with SVE2 support yet.
> So SVE2 is currently masked for VMs when running this.
>
> Known bugs:
> - U-Boot still doesn't work (hangs when trying to parse firmware) but EDK2 does.

Hi; I left a couple of review comments, but overall I think this is
very close to being ready to go in.

thanks
-- PMM

