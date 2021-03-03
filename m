Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5565852lfg;
        Wed, 3 Mar 2021 10:07:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgsU56KIrUHRvXgWT0dZcncu5+VVYsqvx27aUrC3CEsfM4qu9kKoPSsL5CEoBheKjbaW73
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr28222070wrw.355.1614794849169;
        Wed, 03 Mar 2021 10:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614794849; cv=none;
        d=google.com; s=arc-20160816;
        b=zI0cIHk7aI8HA26rVTjL9rF6SoTKg++LixlPlRDlUhqA3t5WvmvSk48SX53Kmlq4QJ
         I/9OKS66ZWlVLU/3vKkqV1sphuRW9GQzV8aNvohcFRBARxpqlBkitwbW/Cp5gFNBgFFk
         l5YFczswfGS80QFDqHXrhyS9yGnRy341ATPP3G/qRGXUFbRPe2sMri1QCKWrqKxq8F+/
         q1DRILJQJrs+cf6Apvh4wdTo8yckolnd+EsS7Z6+6GvYXWC70IGtuQJNiXt/VslEUlXr
         MJDX7RBDx8W4FUb/RWyK9GSGxYIQ1sBbH2krPFWD/cnA1H8/DtpwPX8beKTdMw77MMrZ
         Fscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMACN5yRfbLSuOyxb0PX8KlL9UJOfHAZvGi1RWpi124=;
        b=yfH+8FgoLt9iowFJiKczoF2Whl46toGcqe4Zxwuexom+lBMMLyOZd5FR0P7tjC0EvD
         +leHm5iehKnxNU9bgmricAa6MwWfZ2Ry65Ssb40+Nj3/s795OQqUQrctZR1qkYS5SQfv
         b1BxuSWFaI2zj4khngnkbSMyYWBi8mX9nrbDvBysdH8T2UI3DRF9jkMR+y3Hh3yy3O/k
         q1Zvdf/dibTws5vysd/LBQTvtcyRumHrlklQkRQ6anfju3F4n6IiQlzkS2wnkkRfzX/u
         exbASL/kf8d71LJuWspBHiXSwdygN7P7/e/tImOrQzgJZKUJvSxGGHjliYIVrOELtvO3
         zAVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBRoieBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si15338548wrc.255.2021.03.03.10.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:07:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBRoieBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHVuB-0002ct-Sn
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVtp-0002au-0v
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:07:05 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVtn-00048a-A4
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:07:04 -0500
Received: by mail-ej1-x62d.google.com with SMTP id mj10so23916806ejb.5
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eMACN5yRfbLSuOyxb0PX8KlL9UJOfHAZvGi1RWpi124=;
 b=rBRoieBjuzmUoI+Sv7GP9HBNxHIuHNETdd53xQnL4kayOfSLGhAWvTwE+8ih5LomtX
 R5MDgShpM5VFJ5dOE9Bt3loA+vYqZm4vITmFLyeVuxYE6NrxAO6BJrQNTB9Y3YH6kIFc
 TPPnNpe+3sMAQQBT92NKiwmHKjpSDhm7cG7dHOi6oZ9leKa6UF8bQ9JC7Qa+PIMDn0b3
 /YwYha4UTJzs/r7iNt/IdmTbOBpSsFrdxRwAYLa4993oGtxfaPWYs2VwZl6SbLTRtn1Z
 L+AotTUl/vgboMm/i5GxeN5rTedE7vnl4RUwDugFMaX+jQvyjgxsktNSpXlVMhMpnliq
 tg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eMACN5yRfbLSuOyxb0PX8KlL9UJOfHAZvGi1RWpi124=;
 b=a2w8ptNIXiSTABmxNgzH1maRig/PcbemV9RHsUP16fL75tcH56ga0o7XXzwfmkB8s5
 Qyf6tSVm3Uu+EVVjQun1NG5cc9Yy581xcRm35EKLBIpfrzhT5rDdYGA8NhUcxiKeRpTA
 eE6zoH9EYw+OzX6YVCUvLKX5TTRQWPvYZuultktmLcUvVX7clFZ3333dwD3gc+6jd7Ey
 0o6+BYnG5co2Jinjp1YzHwiwb2nGclO9JzPQAl65dN2bi7CWcuWCUJtqVkgBwDVJD8b5
 mXjWI6V8rHN/nBBCN3ISVH0SvcaP0/bNc+y4E1xOArH2ObvwV5evv8Iq+dlELFl4cSKa
 A+EQ==
X-Gm-Message-State: AOAM532/pHC3xSru/yJaGpj7i4uMRvDp7kha2qpc8BAxD+jRXohR6tS9
 PAKW1rqxVL4DunS8X56V65m3oTbp+5CwDvY7YhqH9Q==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr81051ejc.250.1614794821376; 
 Wed, 03 Mar 2021 10:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
In-Reply-To: <20210303174849.GF1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Mar 2021 18:06:46 +0000
Message-ID: <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7eOJxm7oxO56

On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> It would be good if we could get 6.0 closer to SBSA compliance.

How far away are we at the moment ?

> Would it be worth the effort to make this controllable per cpu model?

I don't have a strong opinion on whether we should, but if we do then the
right way to implement that would be to have the PMCR reset value
as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
it is; and then instead of using a PMCR_NUM_COUNTERS value,
extract the PMCR.N field when needed. The hardest part would be
going through all the CPU TRMs to find out the correct reset value.

thanks
-- PMM
