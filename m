Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp453455lfc;
        Wed, 2 Sep 2020 04:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPQcwUNdV10XohseKt10YDKt0rx7+/Ccf7F9WocJkJfcV2Z/SgTcRi5dHQB48jVdVe2l3z
X-Received: by 2002:a25:71c3:: with SMTP id m186mr8409756ybc.394.1599046928059;
        Wed, 02 Sep 2020 04:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599046928; cv=none;
        d=google.com; s=arc-20160816;
        b=Qtie28NRe5KwExAnuwM5AWNzlB3SIjiUHDjPcOmhN47aUSdnnvyEA+7aTXpBsHzW7K
         EkTXB2SXWYs+nAgXxwe5oV4y6tlyR+h5/iEEiGJVaafLDlbCMeMfUiNPl+Qj3uTdMSYP
         22regnJk3mq+kgjc9xnKTveohQsdsczFqgfTynk0FlojcIERDI9DpYCHLKQr/LnJSPA9
         /whv5T587+VqolaEkVZPb7g93I1/h7xH6m81+Yu474+UV9iRHeijit6dyoSZSkBXeQjN
         5u4udrot32dUuiOnIntdgORH0uk216+7dzJdYJFOfl5p8meo7CcqfRaVipoXe/LyWNIf
         3B9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SoCVG9BorLFUkdn+NRpKWQC2uGdyka8Wt05BItvtj1I=;
        b=ERay3VO4SXDMcXsUcZq0XBnkyHsWMd0FokuwcYWDSTt8zHmm9dHJaW2duybPGhd9YH
         SiRx9GwmFC1FrLP9Lzoioxd4JETTUfQYUhpJVVotmX1XjbUqOYPRZYIb8Vpf4AUN7Su/
         wVeZHj8FjQpgdjKeTFQ8VvOupooCtH+a+JcRZNK+dJ1S7rKAduU9CszhaxTnStIYA/J3
         aZEz1dD8wZqrui2QQ8PH69H+iSR1HTklYf/S3TqO+d2JIPElq8NMqnaRPmsfe8lr7UHy
         tE7S3fJjnVwsdDgbZ1crVosswf1G5XjAx+Erf4PEapqRWjj98UVDg3P+Eeodvk8LXA+o
         5vYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N+dYNQE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m72si4127631ybf.14.2020.09.02.04.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 04:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N+dYNQE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDR9T-0006Pg-Gg
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 07:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDR9A-0006Oz-Sf
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 07:41:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDR98-0005PY-E9
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 07:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599046905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoCVG9BorLFUkdn+NRpKWQC2uGdyka8Wt05BItvtj1I=;
 b=N+dYNQE7UoZkXpvEm+klxSC+jJ54L6In+otRsWpMcAQzgajIkNnpWXeJxJAnnhAArKtL4G
 c8QZNL4PyIrg/5h/znn3O30ZnHmWgl9zMt+z2LQJsj2lrYBW3FKWvXUSXltc3j7mBSFqXQ
 n/qRU4RLvQtoeSbBmwIKWlnpAyMf+Bo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-_mdgACoyM-CR_-J-bpew2A-1; Wed, 02 Sep 2020 07:41:43 -0400
X-MC-Unique: _mdgACoyM-CR_-J-bpew2A-1
Received: by mail-wm1-f70.google.com with SMTP id z1so1806211wmk.1
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 04:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SoCVG9BorLFUkdn+NRpKWQC2uGdyka8Wt05BItvtj1I=;
 b=Vaz5XznZokp6kLf4rH1u3WQxUAT9Qms4DUlyuy2lyWGcAXzcruXDC15ZalUzbfVPAL
 7u0wV1x4HkgnhswD7CXKNPxBJLR3mWDy3rqT3uJAT7jVy4fFbl/OselkJ+zMBn5HZvTA
 RVrnb3o+2O815PbfQh29m2V/WCHbVxvo7VFw7VsQucVZHFxWl45kb0KLgbVwKTTE+kBV
 ZIEjumLsvcoEUVC2+VCAenhsOVlMeaBbkdH9/VaphRZWTdJbcHjqowdss3spfPZDgbDI
 yOOw4ZiL9fJOLq4X0CSFSVAY4rNpw7+LPccasltuwshjmosv8Dula3qCjRUXSdT1Ot4x
 k4EA==
X-Gm-Message-State: AOAM531WpKwlZAl6j0a2OLs/hX676qFAStG7AmCbVDgeFKFXs2wdzVUS
 1aCoj8nLJYyATdUEJhXYnd6qG1p3/B1j+2QViu6LmcVvPWKxXv3Xp44ZXN9ugPuMbye8DEVh8NC
 jnRHSlV8zCbKS
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr268022wmd.104.1599046902209; 
 Wed, 02 Sep 2020 04:41:42 -0700 (PDT)
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr268001wmd.104.1599046901985; 
 Wed, 02 Sep 2020 04:41:41 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.193])
 by smtp.gmail.com with ESMTPSA id f126sm6140513wmf.13.2020.09.02.04.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 04:41:41 -0700 (PDT)
Subject: Re: Cirrus CI for msys2 are working now, but still buiding failed
To: Thomas Huth <thuth@redhat.com>, luoyonggang@gmail.com,
 qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE_SkH-2dNULFAZNiRNRNP=OncwCy=xrDk0J3bzS1Th=tg@mail.gmail.com>
 <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac9ee76a-bc7f-0715-4324-d33c2fb2bb66@redhat.com>
Date: Wed, 2 Sep 2020 13:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9n0XRUEmT9FX

On 02/09/20 12:38, Thomas Huth wrote:
> Wow, that looks quite promising already! But I wonder why the build
> system is trying to link libfdt to targets like qemu-system-avr that do
> not need it?
> And for the targets that need fdt, it should use the dtc submodule... I
> can see in the log that the dtc submodule is checked out, but it does
> not seem to be compiled ? As a test, could you please try to run
> "configure" with "--disable-fdt" there?

Mark and Yonggang have reported an issue where the linker gets
an msys path like -L/e/qemu/dtc but it wants -LE:/qemu/dtc instead.
But fortunately we can just use -Ldtc instead, which would be a patch like

diff --git a/configure b/configure
index 56ceca2f68..34e81a7b60 100755
--- a/configure
+++ b/configure
@@ -943,7 +943,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   kvm="yes"
-  QEMU_INCLUDES="-isystem ${source_path}/linux-headers -I$PWD/linux-headers $QEMU_INCLUDES"
+  QEMU_INCLUDES="-isystem ${source_path}/linux-headers -Ilinux-headers $QEMU_INCLUDES"
   libudev="yes"
 ;;
 esac
@@ -4259,7 +4259,7 @@ EOF
               symlink "$source_path/dtc/Makefile" "dtc/Makefile"
           fi
           fdt_cflags="-I${source_path}/dtc/libfdt"
-          fdt_ldflags="-L$PWD/dtc/libfdt"
+          fdt_ldflags="-Ldtc/libfdt"
           fdt_libs="$fdt_libs"
       elif test "$fdt" = "yes" ; then
           # Not a git build & no libfdt found, prompt for system install
@@ -5244,7 +5244,7 @@ case "$capstone" in
     else
       LIBCAPSTONE=libcapstone.a
     fi
-    capstone_libs="-L$PWD/capstone -lcapstone"
+    capstone_libs="-Lcapstone -lcapstone"
     capstone_cflags="-I${source_path}/capstone/include"
     ;;
 
@@ -6244,8 +6244,8 @@ case "$slirp" in
       git_submodules="${git_submodules} slirp"
     fi
     mkdir -p slirp
-    slirp_cflags="-I${source_path}/slirp/src -I$PWD/slirp/src"
-    slirp_libs="-L$PWD/slirp -lslirp"
+    slirp_cflags="-I${source_path}/slirp/src -Islirp/src"
+    slirp_libs="-Lslirp -lslirp"
     if test "$mingw32" = "yes" ; then
       slirp_libs="$slirp_libs -lws2_32 -liphlpapi"
     fi

Paolo

