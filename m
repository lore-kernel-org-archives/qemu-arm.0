Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp117895ejq;
        Thu, 4 May 2023 00:16:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4t+nkpqJlVKKRIE1I3fVaYmr5LYLulEnVSf9rvYCtybZZx48jZoa+qIHtjDBkGUwP/vsq/
X-Received: by 2002:a05:622a:1b8b:b0:3e4:e61a:669c with SMTP id bp11-20020a05622a1b8b00b003e4e61a669cmr3390744qtb.8.1683184576866;
        Thu, 04 May 2023 00:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683184576; cv=none;
        d=google.com; s=arc-20160816;
        b=M7n+7wuZ0KbXPq+ciErMjOFh4ZM37/AAKyw03qS92nVORBrXeOIvqW8Y4L+bf6KijS
         GWiLrQhER9ofgT0TY+/Gqv/Z+6Nm1YGidE5+GXKMk0em2jPNCSJkfleDJqodnKGiU/5a
         uSs5hb579IYquLj9B2Z8din88BW7IDwKpLdFVOUODoI6ii7VEQANksNEcSPjKLQAgb7Y
         /OCv6eKV1cXSUiIO00T5n5xHrMj5xtd1Ic+ZX4wYwFHWicU2HIK5M9umBgzS0txagQkb
         Kv6QiLPqCyhgT2ClMv4+/+apRZIovWERUU95emLudDNmNIy/IMWFWxaMtRbrbS+c2wBw
         aBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9IE1q/qdi2W7aX8zN3wPgjgug9AB/qfuBhcQe+kXfo0=;
        b=uj32P2mexT2X+o5Z1kBbi+28QuQQFLWIKvPQcg2ZU2Qw2SW2wGJL4F+si5fDUGLBib
         jySWXG+YEbosfP6AmWrl5nAfGehwqiQJ3dROK9JSrj5v2gRcCYgy09bVmShx3s0KnHy/
         EX70kXlbD6g6IVij1sEvuFNOUXdmT4VipVUlDNkOD0iI6nBouMtBy1SLiZDbuzCg03cA
         xmOfHkIStn5rc5Q/i4BayhZZbLQQaRSSGShNTaGV8eIavyrf7UJrl+AIIPELhYc7ecE5
         VmUKwRJ8FUPVsThUrwXF+CpDu+oCJOCJTdogRd2aYo0/6lNxuxd2XzSevFfWv7DIRuJG
         Ct/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fhwvs/cJ";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o22-20020a05620a229600b007484c2fe683si18363692qkh.187.2023.05.04.00.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fhwvs/cJ";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683184576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IE1q/qdi2W7aX8zN3wPgjgug9AB/qfuBhcQe+kXfo0=;
	b=Fhwvs/cJZYfps0QO+bY3oSnMjoxkO5Y2mEoraWtSxdWxltBfiAXZkRzWAdxzmY2eYIxFZJ
	8nJPoQqg5scEbOhbfnmPLhyKK+f0RhARYosYS+CUequ5x0TOqTdpqyeM0B8/VrnNHPCSmm
	iDVMiCpjylIGzmWkMm+3lvLTSWv6vWg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-H6WTHOrAPbuD5KtCzKCiag-1; Thu, 04 May 2023 03:16:15 -0400
X-MC-Unique: H6WTHOrAPbuD5KtCzKCiag-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355c9028so13065466b.3
        for <alex.bennee@linaro.org>; Thu, 04 May 2023 00:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683184574; x=1685776574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IE1q/qdi2W7aX8zN3wPgjgug9AB/qfuBhcQe+kXfo0=;
        b=Cr1OYCb52VwZRuH/Y8AUnedRdzhPEyW8xxvkkW5PD9OtNq0qHwqJJVwB5VILn+P0f2
         X1qKVZ9Af5KYaFGsA7Pu5cg4gZVwRYuGHuC5wgi3hy8krwxpR6x0EfIA4sv0W1pr2/nV
         jkYPP0LIt7j4+rKQL8Bd+4pDo5p1iivhr/J7xAS3bpeKiKiQV8rdsUbt0az2m2LI8BUX
         paTxhQaRjTJ6lbCBjcAlaxGTyVgx5+XjHED25EOLtqZmiwATvrWTIXm29CpuMSv9kGRW
         upLT3d46PqLZiDHwZcZP4A6cujYtHhp83gCMPzOEQZo+8lTYE4k/GlF/FJlOd5s0p/iR
         8BsQ==
X-Gm-Message-State: AC+VfDycVTlNO3hTu7XrAbZ54QEfNNOUMMG70sbM9nHcRuSiMWESKfNx
	BDtg8ZipQl4eheyhUrG9i2N9XWxlvim+Dxq9oIcdbEVf0G/WF3c9L6h45fzWL6Pu5LdBdqWQKb2
	WiYgMHDorfAhw9IuI
X-Received: by 2002:a17:907:6e19:b0:94e:8cdb:bcee with SMTP id sd25-20020a1709076e1900b0094e8cdbbceemr6269379ejc.70.1683184574065;
        Thu, 04 May 2023 00:16:14 -0700 (PDT)
X-Received: by 2002:a17:907:6e19:b0:94e:8cdb:bcee with SMTP id sd25-20020a1709076e1900b0094e8cdbbceemr6269360ejc.70.1683184573677;
        Thu, 04 May 2023 00:16:13 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id w17-20020aa7dcd1000000b004ad601533a3sm1547080edu.55.2023.05.04.00.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:16:13 -0700 (PDT)
Message-ID: <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com>
Date: Thu, 4 May 2023 09:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CoT4DRDi0FmV

On 5/3/23 20:32, Peter Maydell wrote:
> Do we really want to build a QEMU that then barfs unless
> you pass -nodefaults, though ? That doesn't seem very useful.
> Something somewhere ought to be saying "if you want the
> virt board then you almost certainly want these".

Well, the point is that --without-default-devices is intended to be for 
people that write their device config by hand.

However, perhaps we can add to configs/devices/ enough lines that a 
--without-default-devices configuration is moderately useful.  For 
example, some of the changes in this series could be rewritten as:

diff --git a/configs/devices/aarch64-softmmu/default.mak 
b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da116..3aaca2770590 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -3,6 +3,20 @@
  # We support all the 32 bit boards so need all their config
  include ../arm-softmmu/default.mak

+# ------
+# Boards
+# ------
+
  CONFIG_XLNX_ZYNQMP_ARM=y
  CONFIG_XLNX_VERSAL=y
  CONFIG_SBSA_REF=y
+
+# ---------------------------------------------------------------------
+# Sample configuration for a --without-default-devices build.  These
+# devices already default to enabled; they are listed here so that
+# building without default devices 1) still results in a somewhat
+# useful emulator 2) does not fail "make check".
+# ---------------------------------------------------------------------
+
+# For CONFIG_SBSA_REF:
+CONFIG_VIRTIO_NET=y
diff --git a/configs/devices/arm-softmmu/default.mak 
b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c7e..81057d146d1b 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -3,6 +3,10 @@
  # CONFIG_PCI_DEVICES=n
  # CONFIG_TEST_DEVICES=n

+# ------
+# Boards
+# ------
+
  CONFIG_ARM_VIRT=y
  CONFIG_CUBIEBOARD=y
  CONFIG_EXYNOS4=y
@@ -43,3 +47,13 @@ CONFIG_FSL_IMX6UL=y
  CONFIG_SEMIHOSTING=y
  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  CONFIG_ALLWINNER_H3=y
+
+# ---------------------------------------------------------------------
+# Sample configuration for a --without-default-devices build.  These
+# devices already default to enabled; they are listed here so that
+# building without default devices 1) still results in a somewhat
+# useful emulator 2) does not fail "make check".
+# ---------------------------------------------------------------------
+
+# For CONFIG_ARM_VIRT:
+CONFIG_VIRTIO_NET=y


And then we can progressively work towards removing "2) does not fail 
make check".

Paolo
