Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp873592lfq;
        Thu, 17 Sep 2020 12:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtANoQvxcAfQVEkj2aanhJEdg/N8rl4Sbce4uxbbUTWrHqSXLS52JEflOdIcjz4Z+N/p0T
X-Received: by 2002:a25:6116:: with SMTP id v22mr26410097ybb.272.1600372487297;
        Thu, 17 Sep 2020 12:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600372487; cv=none;
        d=google.com; s=arc-20160816;
        b=akJZV78XzsVsHbTUGNxQEUUAAOQjxHMTSQY/UahB6jVBnwYfz5forAqBmwz/xfL6Nf
         slFVYlYMHUzd63BqlKPr0WO1jJCZa4gLr8XR51/4/Lj0JuuPFnHyEBph279sE+Lf5Qgq
         9wBiKr1CVQQE6fkN9tbx3xREHYIqGlwQsZ88r7BVWB3QwtPX9W4dUVvZT5vUkdq7+DJ/
         yOHexxgK2pnxGgS3RQACqUvExaI7Tz/OLPN96w8vwNcBjdG/6SJ/Xk83gYCTIseqiIhQ
         SWXAlEx8o/fa5ssGE6UNmiwOnBEahok92/jxsaCRqQBop0HlBSibYIojIPaC+tLOtH1Y
         cAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TrUelx2LGJWwLBAW27oUlQK9yqUhJhsGMU0O2aE0xgY=;
        b=KnGECumaMDRC2LyZC+5TQ0QXR5JTd6Jq3cgDSDCJaQa4g9Mo/ORaUW+3lQbHr09hsL
         4yWxxjffBfpv2EoMAGqZjIEZDIXiLtWBP9WI9EzkItYrkX1uJAUn8qqwazXW0jhTYa/5
         nSf3O/0ihQuHzYDO4LT/0kEG1E5U19rnXIfQ8jXgx3eGxk6VZ2txNwFBLzaIdyArbWv5
         CbRZmHHILbi/PpRT/iMT5kWD0/450qZqU/6VpGXxDIGesCAQFkhfITtY3Hv6W0S4HVId
         Dmfv/Ng2G0JXOLI58f70KvDIqIARIDNC0hSy0RUsLTrCgp2ezOMjSKGTHJ4CSTGlEGoY
         lzCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vbWhD1sc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j203si510921ybg.316.2020.09.17.12.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 12:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vbWhD1sc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIzzS-0001nh-Jw
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 15:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kIzys-0001lu-Fx
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 15:54:10 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kIzyq-0005eO-Qq
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 15:54:10 -0400
Received: by mail-ej1-x62b.google.com with SMTP id nw23so4959625ejb.4
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2020 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TrUelx2LGJWwLBAW27oUlQK9yqUhJhsGMU0O2aE0xgY=;
 b=vbWhD1sc/NFFvY/OqBX15MUDg8kkrOOfrygIY/gKUGCo8jo4Zmse2JFKmJLlUEhTwB
 pZSIv0MRwdF46nmjNCFYrZhxV9SUXt8EQEloQENpaThG7UgPSuZbURyKG/mS3B2k71p+
 gwoTgOAZndo7MCX1LeQJPeOClwydTMX2HLDpBTqAGBtDxlIPE6Lw/vbHmgEfETENaN5F
 Hlvr5BpFk7sblkgE9rtYPFSJApV9Z2ET1kP6Au/M5uWwn1Pd8SWlyEqn1zEiLhoqIV+Y
 8H1GKkSeEwdiVvZ50K5wJvOgruCNkf9IgK+Jlb5Epf914OQbusst85JBJpvofBeAvtF1
 PoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TrUelx2LGJWwLBAW27oUlQK9yqUhJhsGMU0O2aE0xgY=;
 b=mgioQm+74Ej6tRkXF9eJxOYs90T4IFvZs6WiCk0mQmAwLHv8UEfSnDnssW01zxyTFZ
 D0J9a/8sUBXAV6n82TKmvHHTZDTrpKAvb4qxVC4mJ1hunVpaW9aLtNSXCkxbIa1wurSb
 Si+H7fUIrujAz5sIcld/rVdqEUouZayoLYeUJMHpADmcDkE6wSJajwDAU+qVVQOfuznt
 vQS41pPuqO8bqxH8wVsQWTLC5xi5MuLgBRIe5/N64lmj0tqy6MwKSXlz9MR8yPXugtEJ
 fwspxXz53lv/igAkP+J0pJi1gVaUeDQQ6xIMhbgn30yKUgMozvWzW0WrB1WKC+z42wFm
 0zVw==
X-Gm-Message-State: AOAM531B1ISt4PhTY2iT02Jdh/KRT8WPM8Xlsgk8PXVmIX2CNvx/CLJs
 mumWrfamXMLgrHLh9AWO4i7DZjz0dnj0t1yfzpPIcQ==
X-Received: by 2002:a17:907:20d9:: with SMTP id
 qq25mr31000426ejb.382.1600372446630; 
 Thu, 17 Sep 2020 12:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <3FA3CCC0-72A3-42EB-A12B-7FA0A30E106F@panasonic.aero>
In-Reply-To: <3FA3CCC0-72A3-42EB-A12B-7FA0A30E106F@panasonic.aero>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Sep 2020 20:53:55 +0100
Message-ID: <CAFEAcA_PFGc2Ka-egqYqzMq0Nu_aRiNUPif0yntg4L56UTi7MQ@mail.gmail.com>
Subject: Re: [Qemu-arm] Assigning sd-card to specific SD-bus with Sabrelite
 Machine
To: David Aghaian <David.Aghaian@panasonic.aero>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s3NSEj0ir4WN

On Thu, 17 Sep 2020 at 19:21, David Aghaian
<David.Aghaian@panasonic.aero> wrote:
> Having a real difficult time determining whether or not I can use qemu (a=
rm) with the Sabrelite machine type to be able to assign an sd-card to one =
of the 4 available sd-bus slots. Currently, no matter what combination of a=
rguments I provide, it will always fall on the first bus (see screenshot).

> Is there any way with QEMU to attach the card specifically to the last sd=
-bus slot? It should be noted I was able to achieve the expected behavior a=
fter patching QEMU itself with the following change but I=E2=80=99d prefer =
to not have to modify the tool itself.

This ought to work, but I think there is a bug in the QEMU model
of this board which means it does not.

> diff qemu-5.1.0.orig/hw/sd/sdhci.c qemu-5.1.0/hw/sd/sdhci.c
> 1311a1312,1314
> >     static int index=3D0;
> >     char name[64];
> >     sprintf(name, "sd-bus.%d", index++);
> 1313c1316
> <                         TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
> ---
> >                         TYPE_SDHCI_BUS, DEVICE(s), name);

Thanks for the suggested patch -- this was a big clue about
what the problem was.

sdhci.c isn't really the best place for this to be done -- this is
the model of the device itself, and the name of the bus as part
of the device should be 'sd-bus'. The right place to fix the
bug, I think, is in the hw/arm/fsl-imx*.c files, which are the
implementation of the SoC object. There we should be creating
aliases on the SoC for the various SD buses (there's an example
of this in hw/arm/xlnx-zynqmp.c), and the aliases can all have
different names so they're usable from the command line.

thanks
-- PMM
