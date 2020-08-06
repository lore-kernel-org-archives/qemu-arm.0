Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1611916lfy;
        Thu, 6 Aug 2020 06:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTZ1SQFmkC0cPWlGK3XVVl+ct2duueSpiXak3zbNcnJaS2KExzZ3dYwyJftQNtprW0LV0L
X-Received: by 2002:a25:6b49:: with SMTP id o9mr12073435ybm.111.1596719169896;
        Thu, 06 Aug 2020 06:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596719169; cv=none;
        d=google.com; s=arc-20160816;
        b=L8V2Y9lWtHlG4CzZWPGJid80OcbjgjCikpwEh7sdPzuBr4JBPMhhPlfB6a9HsaMws4
         lKjgT77AX2sh8wO4bYxbxtUccFurLPU4vSaz3oCyTtYYLRkvBPN+MI2M6RuEN2n567u6
         VtdXVc5Bhd0SV7q39F5O+k0/tWR/QGM0V6ZAM6BNJmd6J9Nui1hPzmhsPKf8wr7VZjM+
         KQ07E7RCfD2kxa69Vyr1y/rGYqFAOU7PjlKme1TIicaFw4v5BIAror2hqeL7tfb7TvhZ
         6DEyiFmTgcrfKFnGC4JcD+M3TggOP5uKff93B5FBlg7upCy3bSkP5EBxg02M7C9sjQdc
         +p7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5VsPjTZL2NDQ0SByYGQq+rFR4fYGfHX+fiU31UUZdw=;
        b=A6k5uOdYC7LUDYakweHlePT0RLFZifm5MX3HiJ/Scj5o+wDddT4b21sXj5bOh4EiYg
         Dtkh8lZeH1LXFK8LbjHNzOaE0Xi5bi9UqiXIQfkDrFohOA1I77juO6lWoEd+Jh+Le0pc
         P45QFzB2ZzIxvi9v0Tp6jPWprmbL1lBwA1yAjXuC7KFUD9ZuGWrrpGV3y4p+UsWQ1z8R
         1WmOYXK7/vVb6xpAlpRmg1mzReOItGSo3UrbtK1I7fFvgEj3dGqp+rEef75LbfrxzgX2
         /VvAoiz4A4Iu8BSP3acyEq/rzqOvnj4YkrVk31XxNGVl1c50M/bPoxShAm4Gz3ss7TWD
         Wwkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BDs7Nszg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si4601350ybs.375.2020.08.06.06.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BDs7Nszg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3faz-0005Qp-9l
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fa7-0004Bu-6A
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 09:05:16 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fa2-0007CJ-4E
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 09:05:14 -0400
Received: by mail-oi1-x242.google.com with SMTP id e6so22539534oii.4
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a5VsPjTZL2NDQ0SByYGQq+rFR4fYGfHX+fiU31UUZdw=;
 b=BDs7NszgDlpGPZk4BcsY+K7MDuGLU5cVLI7pqokZxTALypn7B55YSuiyQZWUPs5vzl
 L7PyMC8uG/lWXoW02yOjR6x4eyZy6x19GvJuPDINY8jCrfxwvIZJzWTaChbF+aaNz8lx
 yNwzowFBaNzUFG1xMlzHXSSHzhSrvA4Wm7X8Bjcfwj4qcJ7RUVbLT0Zdcj3t807syr5p
 5/7BfXGOlV4ShdZoD2szBEINk1+/ZGO5Pyk+O4+Wk6d34ADqmdxn1QsNAD36yGZhA0JR
 yKGyVmqPIaTZxfdoCN8PY003GUZ+jpSQ+JjlasHm9GqXpThhiKSbFSpldc9BCypI5sKU
 XGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a5VsPjTZL2NDQ0SByYGQq+rFR4fYGfHX+fiU31UUZdw=;
 b=RYTT3hpKBObI/1P5qzTm7fWII+VkrWbG2o0/10GG3PhGueuFFQaHum0Sg4wMt8GNaQ
 DCpEIo0NMruoC4EZEg1+CesCHpL48cyL1X3Ve/kdwA2MrXXRV/pozY7X21HWuOGVJnre
 MduN7Mwy0pNwuwFrQbsmNsAX19dXmIks2nXAeDNIVNFzBVuDkLAkMITvm0Vk/FGC2UI1
 Jz+cBjhZ9R5IUwn0L49wOYlzFMeFz0/hSCK2Pb3iZVHttxjSOLn7kra676BJaAThS8xy
 o6chPjtU2Bis9gQUySTSmt3xsDxwPyhsjtrUL9GV+PirGdWt6irLhcP992WN+eN/QCCW
 2xAg==
X-Gm-Message-State: AOAM532l/xyYecWQY4qHqJ0cNYt0ixLnfpoWmUQcKKRbYKEYrz/jm9tp
 fPWTQqbN37OezH+y2lnVaf1Dpv5P75jstI56O1Movw==
X-Received: by 2002:aca:4a96:: with SMTP id x144mr6834152oia.163.1596719108443; 
 Thu, 06 Aug 2020 06:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200803164749.301971-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200803164749.301971-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Aug 2020 14:04:57 +0100
Message-ID: <CAFEAcA_ZAgnW4zjaTPUCVHjzWhHeiEastQVfGTP39V0og8u8Vg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] docs/system/arm: Document the Xilinx Versal Virt
 board
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M7ldSbJnBl0C

On Mon, 3 Aug 2020 at 17:47, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> This adds some basic documentation for the Xilinx Versal Virt board,
> including a few command-line examples on how to run ARM Trusterd Firmware,
> U-boot, Xen and Linux.
>
> If this looks OK I'll send similar basic documentation for the ZynqMP and
> Zynq.

Looks good to me; applied to target-arm.next for 5.2.

thanks
-- PMM
