Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1156580ejb;
        Mon, 2 Oct 2023 00:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJwJDxWWO1T5fDYs7MmSc9UAWr5n9voQXihVbVs9oBnyoCm0tXRYdi2yxucZF8OxMGDOH7
X-Received: by 2002:a05:620a:46ab:b0:769:89c8:4fae with SMTP id bq43-20020a05620a46ab00b0076989c84faemr12505868qkb.52.1696233137780;
        Mon, 02 Oct 2023 00:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696233137; cv=none;
        d=google.com; s=arc-20160816;
        b=Dv1kGyjioQ1QR58HD4V/tOTvUlKS6lYgl4nnPAytmwWTd/49d5NDqI7UXOufxGvku8
         cnEO36okQYsaG1jQUVvRMsT85dxEizrxzw6d/NxQUKLC39Uy4nHuIea37x9vxxQDqrxF
         gRClIgVCyoCma2dGI7HbZGuNkFTTUCbGmDfOjfEdYaM7yGWGLP6jmBRGpTIW5YIcIO3U
         UtMfxwV3dT/aOBSTPjEE7mTSkh3f2bpdykvKVrFAY/aOsIApol3XrL/msKnhXH/elgOS
         Q3r24y7u2sEn6fgqE28PlTgkc/X7bBt8qu0Mu8fFl2a4L33dff+XPYyldZG5pyFqpFx+
         jRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=++vRx+Fcnkk2PGBr4yKtkr+ng4Q+C3I2qbXPBEhY8Ds=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=oD0oUj4zN9CO5t7G52wz9khZwG6qJnyYMtN64fRiuy0LJqL/lsCdHrsWpQ4PAA9RHU
         IkkU2fwmYQEm4+pkJtfaRW9cwkfgoqZc/i08Jsv5nkFFzndeNGn5wV++9eXC2ZgzWTTS
         1jKQYVsvVaAgoeBGA/jVTGfu+6yQXuoUALaxbOMybNeaE+x8IpPca1suwnfhnnBw9OJK
         idrExgpKpCYNgigS5QQ0ABZwrjjDVap0SMieOrqw2ru67HmSmK2YD7xnk03yd4Qv+QBi
         ssLAIiTo7snv/Sy4admPUVrfKo1Q12XcYj0Kb0clJKWzC8HxVkmYYd5Mo+LYlWXM3z7a
         Jt2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeRFc58W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a05620a2a0100b007758ed711d1si2483467qkp.55.2023.10.02.00.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Oct 2023 00:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeRFc58W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnDin-0008IQ-Hb; Mon, 02 Oct 2023 03:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1qnDij-0008Hi-Mg
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 03:52:03 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1qnDii-0007Aq-2O
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 03:52:01 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-59f6041395dso154460887b3.1
 for <qemu-arm@nongnu.org>; Mon, 02 Oct 2023 00:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696233118; x=1696837918; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=++vRx+Fcnkk2PGBr4yKtkr+ng4Q+C3I2qbXPBEhY8Ds=;
 b=NeRFc58WgY+IDYglxaGht2RWAU6xUC0ahkq90/LnQShzyLxgEs4VVRer6ZTL467dZj
 NPQasyuRRl1wwHlSjPBul+uViL5HIlp4nwt2814XxmBScfKCAydZ3IRauw2XQwiWuoV2
 Uzl7NYbxiH6r1OCJthbSIsqG/OPnwKdaJQnG0ouT90JnmM2q6SZcMQqPRT8a4wGuHLsI
 pjnHZsuEgcFxlAmnQten0O7uVO6h4EMQpbB3rs8hHzUv3zLCvFTcJvuBaWw5yoEeQt4d
 1isAiJpmWBKvAaYQYtZ7vm1eATzUjt47t6ZJk8YnIz6ZYtGcubh/ToSbi+/xNPXj+A2s
 V+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696233118; x=1696837918;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=++vRx+Fcnkk2PGBr4yKtkr+ng4Q+C3I2qbXPBEhY8Ds=;
 b=gYkSNuMwtvmdSzCOSttXtA3eudWnfSBVLNIJsp5OjaFpkXi7SWrkr45jo9CKAuJ4fI
 Fho3Xri1rrV8GmRaHkBGR56usl96vmK54UdfLzX1Kg38aDFC14lfBFTYnA0j4REfSmjP
 m5joUqG4LGQRbeVaTaqsKxEsfsCc9+k2FzvpddaiwbSOB0v1vEGVedLVSZHupxZXFxI+
 zQyes3rQ8unVrJL+LFdF6Teri7sNI6GaTB4GbS2K05NRzDZqGcEJNmcmKMsQh2u0bgZT
 AsG3OMHOEdQfeZCeE50lB/yHNQl9iS9h7HPS1xBwzJ7F9GgjVXYPUqBQ8Tc16dgF1mrK
 bFEg==
X-Gm-Message-State: AOJu0YwlGHS8q4kX7HXwcEdj2NuaZ4ilVajMi1pLQB3JNLNap0e6SRQs
 gpZwaAx3V2lF53V2dt40il3nG0mnbRQUBBwPWJrUBB59V3w=
X-Received: by 2002:a81:4989:0:b0:59f:4cb1:594d with SMTP id
 w131-20020a814989000000b0059f4cb1594dmr10997330ywa.3.1696233117941; Mon, 02
 Oct 2023 00:51:57 -0700 (PDT)
MIME-Version: 1.0
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Mon, 2 Oct 2023 16:51:46 +0900
Message-ID: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
Subject: Quick start guide on RME emulation
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lbL4pT4KSOO0

Hi,
Is there a doc that I can refer to when emulating the Realm in QEMU?

Thanks,
Itaru.
