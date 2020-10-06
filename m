Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp712914lfq;
        Tue, 6 Oct 2020 07:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYMjqeXShJ2ZpBRfUsqum1vdv2BB7tgisIgS5C2oQBX7Y48Ih/LWaNUJpFrSN09dVKjE0X
X-Received: by 2002:a25:2506:: with SMTP id l6mr6978016ybl.390.1601993450593;
        Tue, 06 Oct 2020 07:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601993450; cv=none;
        d=google.com; s=arc-20160816;
        b=UWjFDI4hlfNj5HDa8zGBStpPsFXz8k1cq6NCsWxxG6oJ6mTzzVZZRieU7yh0o1B7Cu
         dmg8wzRXeZBIeeg2AULvqoqKDeL02uCkYeENmRnTjDdXw/89/4n1SlDTpYYwrIIagqYn
         P7GYUDXR+oPNycLd1QVs2Hc41TXMFfBmMZlN5fy6jz0bSNNd0Q+7RoW1jLnRRb5iPsNv
         NtZSRQTrXFX64zYdGYNNgnToRtjfmTd/2kEqWwMlAhofagC1NjHj1AP1Aj3KVmu2yO0Y
         Rp1ECrkCZB8tf5Gl9dXmGJMQC+KhkjgVVguiwDnp2M47AKIGO1kT645961VSz/sFJ5V9
         jqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:thread-index
         :content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:dkim-signature;
        bh=C0hdb7jmXbd/vUa78xKa1jeCXeQSigp9jT7XdO6QLQg=;
        b=Nhu5H/MZziHyDSc1J1g431Q5yR9ydFxXrftXunYHmtH1Ab+kjAnaQTHwylmcScUWXx
         JblbkXkcQpoofCOwMzntwhSHiTbX4vH5iBAEMxQCws3TKfF44GLVEhtjvCO7AQIdnrxj
         gQAandQdJWXAKQ1y8cKq1mrUkNMBQRh2qS3QH6J6vxtNzV8pLNVwA5FaM/LzSgxVXHaU
         A0UoNnhK73dJI1fjZNyH/IoSFat247whY619KLouYlzGNCacHYVHqqu/wydjNi52hdk2
         fy+J5mJBHWFC8Uk6KQ0pbWYN/ucF5yVktKku/ECx5XWIwy87HQsMbeddLI8VZ2asAR0V
         Yicw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dMq1miP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p190si4657972ybg.137.2020.10.06.07.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Oct 2020 07:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dMq1miP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPng1-0004os-Vt
	for alex.bennee@linaro.org; Tue, 06 Oct 2020 10:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.i.kulagin@gmail.com>)
 id 1kPlGY-0003Tk-PL
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 07:36:24 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:42028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ivan.i.kulagin@gmail.com>)
 id 1kPlGU-0008Ov-Qf
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 07:36:22 -0400
Received: by mail-lj1-x236.google.com with SMTP id h20so3668410lji.9
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2020 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:thread-index:content-language;
 bh=C0hdb7jmXbd/vUa78xKa1jeCXeQSigp9jT7XdO6QLQg=;
 b=dMq1miP8tAxSZcxxNpbJBz0LEWU/0NnC7tO99N/N0nnaQUFRHYoNMpLSvVPOugKfMy
 dQrwCa03W/R+nFP7DECJSMz33uXSHtCYtnG2O0lklileqX+L+dIHzxskQOQH1MFNcpoA
 ri4HTfOGm6CY92Hob5rCUyAwQ6xQeV5uAPT1wZ2RQ9eItb1a5qHaFBgzeXllN0GOTvib
 MdwdBtkD8DIFTYIbzEp4vkhpW74fdg52LmhxaeCl1Pg+V94UIsU/F81ED5cb6b0fXHqy
 ZDhLQ5pSPmoe1A8h52Kp8llOeWjsANNUpCooyaEhp+lZ2iTxaeoB1luoReyh+9AFOSL3
 MVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:thread-index:content-language;
 bh=C0hdb7jmXbd/vUa78xKa1jeCXeQSigp9jT7XdO6QLQg=;
 b=fmxV2URqojz+r3ohP8lvHVZ6AgyJHuaM4f0iFtQkizo6WY49o2UW3GHerXhiXq/PHK
 2Jg8btdVlc/XtbXOJYXphw+BlWjr4I37C3viSHVg3eM8uv2vxMzp2GpIXA+HmN6cvbpY
 PSpiV0wFpsF9we2wjitc+KR1LQvHswt8Mq57rLHY9B+XZrd5wAYfYu37FzTrN14zMAN5
 /tRlUFy48Z9DmovdP8v1khbwzv2HY86N0MciwNH4InjKV/TU5pm6ulL4CO4Mu0exnc3G
 NVpu9YfYXSwjJzz9EywXSZ6lLU49Ff6P4WdrX5KR3XBxCF1qtMbR3okZ2WUDnREkj4pN
 ZbTQ==
X-Gm-Message-State: AOAM532ZO58EVgKBlfMUdY6ChEOJudU3NB83H128RbOlur6pGhrbqPjh
 LqoGF66dqra5q9UXPoJZfu8=
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr1674044ljc.128.1601984174266; 
 Tue, 06 Oct 2020 04:36:14 -0700 (PDT)
Received: from DESKTOPCIGI9VR (109-252-80-113.nat.spd-mgts.ru.
 [109.252.80.113])
 by smtp.gmail.com with ESMTPSA id n4sm565963lfe.246.2020.10.06.04.36.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 04:36:13 -0700 (PDT)
From: <ivan.i.kulagin@gmail.com>
To: <qemu-arm@nongnu.org>
Subject: pstate_read/write ignores nRW field that is kept in env->aarch64
Date: Tue, 6 Oct 2020 14:36:11 +0300
Message-ID: <01e701d69bd4$e49413d0$adbc3b70$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adab0i4+z1y77tz2RkS16Fcx3zipfg==
Content-Language: en-us
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=ivan.i.kulagin@gmail.com; helo=mail-lj1-x236.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Oct 2020 10:10:22 -0400
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EA+c17Z5xIjB

Hello!
Could you please explain me why in pstate_read and pstate_write
the nRW bit is ignored?
The comment in CPUState says that nRW (also known as M[4]) is kept,
inverted, in env->aarch64,
but the value returned by pstate_read doesn't contain this bit.

static inline uint32_t pstate_read(CPUARMState *env)
{
    int ZF;
    ZF = (env->ZF == 0);
    return (env->NF & 0x80000000) | (ZF << 30)
        | (env->CF << 29) | ((env->VF & 0x80000000) >> 3)
        | env->pstate | env->daif | (env->btype << 10);
}


Best regards, Ivan.

