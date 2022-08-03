Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp170458lfg;
        Wed, 3 Aug 2022 00:19:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZjFGSxqrH5bANybusxNs/anQNf1A/NfJHa0KfEhv8p1NgbtXAlmJ/uPO1X50ELKndfpe4
X-Received: by 2002:a05:622a:1a0d:b0:31e:da67:7cb4 with SMTP id f13-20020a05622a1a0d00b0031eda677cb4mr20996184qtb.643.1659511195659;
        Wed, 03 Aug 2022 00:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659511195; cv=none;
        d=google.com; s=arc-20160816;
        b=F/esmrvHDqaCO8/4DlEmnzPw8lVXwcU6hDEDtRgo3xZhqxUX0mM/SwiKCyg9Jy06EJ
         henoj6t/dHPeVWJ9dvrIv3dRJUmY+hnYYJcRHBRXzpH4lsDFHFux4Kh9ovehJ84AF+lL
         lMSUK+RyvQ+nPS81jBYM4eIwwwRKNb4SbfiFFqtpmVYLiyvVfNoKGTKeZq50CmiVJHV4
         MTnMBHGUaDPyh4jxODm4+DfPkxS34VRx9Ip+aOpVeK6QD3TR5mFHLjx1hAMhM/+zBwhR
         AB0sqrQIYd7oU1oqx7rNYojXn9A70TCoxkvg3jDnUX2ptZb/cwKsXGSmPze1oz24NwmL
         9sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=83Bzl50cRjiDRvTTK2a+8PVQTAKg3HtXuHQtPIEfRfo=;
        b=w8KOyvLI0pilmv6Z8tmYEefEUPNfpJUji/rY0cPKg/WnrqZ3MYdndyu5MQ5/t2TuMr
         pBdQYbpBUe+yr2AOI50eoR4rSk0r1eUAoOvVS3apBLYu8NXz6HWyupq2LLti/cf6gY4D
         ntCAApr/4VuAi7ji/OefwtdUFcmrMjWroBMjgILYKyip5GPMhcm2HXijWcsU+yXjMdzb
         0FzuCpRKw7dP0d54uOD7kkoVc89yF5cQiE8sXv7vy3NbgXm/4OE5/5c43FszUAi/6qeh
         B1jOiCcejUKO+ogGG7kPW7T5VkS1nDkPAAd47AyJNNfGV120ILT27TdpaiXlM1KNqeXa
         a6jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CxquLYN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a0562141d0a00b0047493170e2asi8592226qvd.197.2022.08.03.00.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Aug 2022 00:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CxquLYN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJ8fb-0006sG-3y
	for alex.bennee@linaro.org; Wed, 03 Aug 2022 03:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irischenlj@gmail.com>)
 id 1oJ4Bm-00009A-EC; Tue, 02 Aug 2022 22:32:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <irischenlj@gmail.com>)
 id 1oJ4Bk-0008FN-Pr; Tue, 02 Aug 2022 22:32:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id t2so15142577ply.2;
 Tue, 02 Aug 2022 19:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=83Bzl50cRjiDRvTTK2a+8PVQTAKg3HtXuHQtPIEfRfo=;
 b=CxquLYN173eX+ltlThkAJsN/SF12SC06/mHNVucHZiuBfXEM0kbcOOd4Ovq5NK1A4s
 aIQYhqEgERnizy3UoDEeeyfCwHI7lqXnYVDBl8oTeVjC+m7aaU9SY642eaUhE5kf/yYj
 7lN7ZjSLpo4XFmvQai4YEW9hwK4MIdwMSKHsiZP8M5s92DTPLZCqPcNXSNaYu/9stq4m
 OH7YrpaxnUHUQA7jIzQfiZkdyc0uda1h9eFpXynErJ1J9g9pEd+gJGTuz4KQnI1Zzz7k
 n498RKd+RopPZOJ8MEo96gysmxLm1PVx48YJx5s3H//HkjG5RQUO5vgAQRtzMrBx5Wng
 C7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=83Bzl50cRjiDRvTTK2a+8PVQTAKg3HtXuHQtPIEfRfo=;
 b=DIYGxYZgxB5Wh317u39UxMUyVp8Fpm3zlyI/ZKrRYTCAMsTWwiDYw9y/eoHBcJFVAw
 nx+gbDJsTXLYQtGOuiNeMdJ54PoRRAH+nFPYxTBMnU9pmfjzaTwu+8AtxF9nTeKXfdSk
 HfqAcjHHtIyQPEMgSkDOd1AlZcwqV8lFb7A7ENFA4cQweGinJgonFN0KLRAmpMJ2wXYK
 DUWRYky/avQraHV9ypalLD6pEqhl+/5fBUU9PxeBlKhW22j/8U0p0pdpzm08YkfTefOG
 4pBxLAw/ILrAwV7uQFfqVVCWZgeflSIjedEzSTinq6vRBNt0pbseUAvyXyNXjtRdk4fR
 wWDA==
X-Gm-Message-State: ACgBeo3rvsN3uH3xszk6N0+OOSpAsTO9l/CwbaaFptIQeghkHJ9xjk36
 b3dxzQaK4k0VOiv6l3pnMlo=
X-Received: by 2002:a17:90b:4a4e:b0:1f5:431c:54f8 with SMTP id
 lb14-20020a17090b4a4e00b001f5431c54f8mr1815443pjb.161.1659493966121; 
 Tue, 02 Aug 2022 19:32:46 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:80d])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a635341000000b0041c30def5e8sm3786247pgl.33.2022.08.02.19.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 19:32:44 -0700 (PDT)
From: Iris Chen <irischenlj@gmail.com>
To: 
Cc: irischenlj@fb.com, peter@pjd.dev, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, patrick@stwcx.xyz,
 alistair@alistair23.me, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-block@nongnu.org, dz4list@gmail.com
Subject: [RFC 0/1] SPI support in QEMU TPM
Date: Tue,  2 Aug 2022 19:32:40 -0700
Message-Id: <20220803023241.63739-1-irischenlj@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=irischenlj@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Aug 2022 03:19:23 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iA+Z5zBXXN6G

From: Iris Chen <irischenlj@fb.com>

Hey everyone,

Thanks for all your comments on the SPI GPIO model. I am working through them.

As for adding support for SPI-based TPMs in QEMU, this RFC patch adds SPI
support in the QEMU TPM implementation via tpm_tis_spi.c.

The QEMU tree already has support for two connection methods to the TPM:
mmio (isa for x86, sysbus for arm) and “spapr”. This patch adds a new SPI
bus implementation for the TPM. Specifically, this SPI bus implementation
connects to the Yosemite-v3.5 model using the SPI-GPIO model sent earlier
last week. I have already tested these implementations locally together
and can verify that the Linux kernel can successfully probe the TPM device
on Yosemite-v3.5 and we can run the TPM command line tools to interact with it.

Please let me know what you think about this!

Thanks,
Iris

Iris Chen (1):
  hw: tpmtisspi: add SPI support to QEMU TPM implementation

 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |   5 +
 hw/tpm/Kconfig                          |   5 +
 hw/tpm/meson.build                      |   1 +
 hw/tpm/tpm_tis_spi.c                    | 311 ++++++++++++++++++++++++
 include/sysemu/tpm.h                    |   3 +
 6 files changed, 326 insertions(+)
 create mode 100644 hw/tpm/tpm_tis_spi.c

--
2.30.2
