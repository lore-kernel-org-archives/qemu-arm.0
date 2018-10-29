Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4477152wro;
        Mon, 29 Oct 2018 10:07:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dAzRKFa+JqaVve6aqy3nkUQbG4xQ5udkV1GQSjS7+8s1cAwxZdDujmojCWx7HFy90nxLHV
X-Received: by 2002:a0c:9e65:: with SMTP id z37mr1883524qve.188.1540832848958;
        Mon, 29 Oct 2018 10:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540832848; cv=none;
        d=google.com; s=arc-20160816;
        b=tm2nb9bJeRrI3QZ9+WWNWIChHOEcb2OX2mp+Nhjy+xbyb8QP4wyigXi8JMEat6jwcc
         KOgA2CpWkxmTdMdwYfVvH6ip9X/4ZOC6O9pQqzAa9jt6CpG54QXU4FknmBGEWVSGbiQ3
         R+d6fKjH6E1WumI3y/3zJHPto9hfUl+obQYzlH+GQSsTtRiburlJygDpj9QVwcRcpWG2
         a6lvcdi+D9rVYmAS5dCKRr2wMgFWpAFPZIAsO/TVq7GrXI64qmNDNFjm33s7nlzVCBcC
         CgXrOVWEFtBMR0+Wj/G/rabsvImm/UUrWuXScuIFTqmacVXXluSlWMy6A/GsmtYktifc
         /ZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=copcel0gL4mF6EEuzbQ89301GTDPwP43vd1vi9UkQoo=;
        b=LYobvhOUIxdR17YLOxrij0raBoFxhW31kN36wLq8ePoxYFL4ibnp8s/Sw4vU5QY1G+
         yGF2Bg1T9SwKLhwW+VNoHOtEGksyj8tMdqHWyWA84nbWkdIhYeucRmQlWYsZ6sGYNK9c
         Ykw2FBj3pz8f3Epn48RPKahuqxaiCGjQIdGff60ORIsATliRKwc3de2C/gE+ucBzPfTa
         9KJ18Tli9375lMNf8VyvF0p3P46FZwhgSM804p2rwe/i4DsQVYqjXIQIG4rD4lJLNGKd
         O5cLf2Q4AKoc2BdLg2mmLpft/xwc9iVFkLl1J6hN7C7FlgNaq/0+v/MihnCuJny2UNPF
         VoRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="f/rCB8wT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p72si2240114qkp.103.2018.10.29.10.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 10:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="f/rCB8wT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHB0i-0004kw-Dl
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 13:07:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHAx7-00027U-B7
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 13:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHAx6-0004kZ-E6
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 13:03:45 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:40483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHAx5-0004bo-So
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 13:03:44 -0400
Received: by mail-ot1-x336.google.com with SMTP id m15so8264192otl.7
	for <qemu-arm@nongnu.org>; Mon, 29 Oct 2018 10:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=copcel0gL4mF6EEuzbQ89301GTDPwP43vd1vi9UkQoo=;
	b=f/rCB8wT/+jnlyGeAlu3I8I+VcgJC7OwpOdu19Gxv1aCqBNMrrAX68kBdnF5Z0ZqxB
	9Iaf2FeSz9WXZe3srxzHQUpWU/U6FWbxNe5UBC4fJnO92ee/EfD78R6TfAk0Gl9E384y
	GH5sIarw5J7YkZq+hG2s1Lw7POAQdgolIfLo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=copcel0gL4mF6EEuzbQ89301GTDPwP43vd1vi9UkQoo=;
	b=faXnwV2UkK5SwCGxX2VajRuuJFomV16P4x3kS1DMrHAAjbMccpciLMjFTxQBmKmSQS
	tFMWNJM5sMPtI0RYnySswh9vM1ynxJKpuiDpcgokb0OvoLnur4uYEc1mQ5pZY87GCCrd
	wOvtanQR4DFEZcg1V52vTQ9tXDB+y262sRWMh7hNGxSMGgUsY32mU9RFBEkFktlJbpMv
	2W7xLZoW5axHldD+mD4FZ1FVeVzKSOy5I8VGYzSQdNQ3VD3iILzbbScvazEjRLXp2T8y
	701BgxVhnPDgXJNOxHJdAF50HzSd5HE96XDnr9JZa9rq/vXXIuL8jcMrwy/o3v33GdzZ
	lTvg==
X-Gm-Message-State: AGRZ1gLyLW9kRRzhvgIyQ1MiDOc1hObDUDmIylijw/0RsgkWvFX7kZ8+
	C1asa8/VxNPLaeBEp5dQmNGO0awrBPzdG7UphByAhQ==
X-Received: by 2002:a9d:217a:: with SMTP id l55mr5310673otd.316.1540832606839; 
	Mon, 29 Oct 2018 10:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 10:03:06
	-0700 (PDT)
In-Reply-To: <20181029133722.12415-1-kraxel@redhat.com>
References: <20181029133722.12415-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 17:03:06 +0000
Message-ID: <CAFEAcA-mjgjC1DPTcArqoLDv+jgOrY_8v-qRhiwDpsFu-4cxUQ@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::336
Subject: Re: [Qemu-arm] [PULL 0/4] Audio 20181029 patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1osHiT8VHTgL

On 29 October 2018 at 13:37, Gerd Hoffmann <kraxel@redhat.com> wrote:
> The following changes since commit 285278ca785f5fa9a570927e1c0958a2ca2b2150:
>
>   Merge remote-tracking branch 'remotes/famz/tags/testing-pull-request' into staging (2018-10-27 19:55:08 +0100)
>
> are available in the git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20181029-pull-request
>
> for you to fetch changes up to d436d4e7a50a7c4fddc0569c2107fe5eaf0e1fbc:
>
>   audio: use TYPE_MV88W8618_AUDIO instead of hardcoded string (2018-10-29 13:50:15 +0100)
>
> ----------------------------------------------------------------
> audio: qom cleanups.
>
> ----------------------------------------------------------------
>
> Li Qiang (1):
>   hw: AC97: make it more QOMconventional
>
> Mao Zhongyi (3):
>   audio: use TYPE_WM8750 instead of a hardcoded string
>   audio: use object link instead of qdev property to pass wm8750
>     reference
>   audio: use TYPE_MV88W8618_AUDIO instead of hardcoded string
>
>  include/hw/audio/wm8750.h  |  1 +
>  hw/arm/musicpal.c          |  5 +++--
>  hw/audio/ac97.c            | 12 ++++++++----
>  hw/audio/marvell_88w8618.c | 14 ++++++--------
>  4 files changed, 18 insertions(+), 14 deletions(-)
>
Applied, thanks.

-- PMM
