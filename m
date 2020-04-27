Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4106508lfm;
        Mon, 27 Apr 2020 06:24:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKcF0YUGREqjJBp1zI51Is55Pagmh1f9cItWwqlOG3l1rZ/dRLB66Q2l0Zh606Bu7MWRmtK
X-Received: by 2002:ac8:582:: with SMTP id a2mr23450732qth.62.1587993840528;
        Mon, 27 Apr 2020 06:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587993840; cv=none;
        d=google.com; s=arc-20160816;
        b=RXvp8MFSA/YildpFI8hYv0136wPG4gCv7ZWEABHugwYQmVhJZhXx8iAW0bCGMIipay
         3YqX3DaDiqhGDYO/8U9uUjaStYZXF6+NpZMJTZoD2DJFu6ciOU9G5BaSzdR36L43zi7s
         1yDZ8Jo+06EjUBhxIrqKUsiFL5ORYji7ATT7/GAyY/8+0i0L0NMucfTjYz5VOR7hqu1N
         HRJk8J0cmUNcFZ3Z9gB/9kf6knFIcECzs34ycFOByY6fPbRnkPPllzpTGyTBsWA6OUPc
         yCsaDDQoYO9CN1X4KoJev4iWeaK1Ro+cO09Nu5gFmbQxt6yMdgN7GmFm0r6l2iBrJL1i
         +sFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RqmLEdTYY4+0eoGr4VmROK+6nEPxwdg81kD6fw/aynY=;
        b=e3jVEVvn+57JONikh90ujwHoQEsGKgj9yGYHlD+Ielb4qwdtz4+x0NvoxpKby2IBUC
         1H/EhXFwp1ILw4FOkHCmEtJttEiKauLubUv6mhokXWEbygBENBZ32Io1bkQhMFyeU+oL
         kK862MJEpAvwdR7YMUz+44lERqyU4h5rb8KMd1nG+V2aqaQcDjpH+3WZKZHvp1g5wcCG
         25kSSmo1rVn7N7PB0fXgh7mLKxY/mDAD4k5CBTmuKkKbGGhEaaQ0w6Fe2VLMQ5SqvXHE
         K8xZSzJuB46lFoJ8BmiiudHjIOMU2XY6nXiyM9oI9uOFzaF4rJrMcTQTozu8Mt2YqCEv
         5WXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mAuOeTar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az7si8965693qvb.195.2020.04.27.06.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 06:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mAuOeTar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT3jr-0002BB-UP
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 09:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3jY-0002Aw-Ee
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3jX-0004Fb-KF
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:23:39 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT3jW-0004F9-Vs
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:23:39 -0400
Received: by mail-ot1-x341.google.com with SMTP id g19so26027509otk.5
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RqmLEdTYY4+0eoGr4VmROK+6nEPxwdg81kD6fw/aynY=;
 b=mAuOeTaraGmIvLGElHb4qVHGTiFgO5nw6jiS9zKkrXdEngxtIqFzIrVrPCdbCwoWSs
 IyTkZb5Nva3aawkkYPVQNm2qJAoHN8fqMq82+T3ABH096tOiKAsNPv2YFln2EGad2L7o
 NVzAaslaVyVCUe8B38wXF/5ogV2niHiUruzmiv2E0CjkRJT+mHEM1tBDcO1gqU6yPR2p
 ntAhagQCRPXhoBcQgZRWWddTEbex/UAvFuL45BTkDDgXWAcE6pDFWG+ONYcjvjyDATFD
 kgHuWJhNGBP8zEB1sdNMtSTkt+hwottnndzK2Cp6yRdnJ9Jy5cUnst/pM5jymEkTJuPr
 A7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RqmLEdTYY4+0eoGr4VmROK+6nEPxwdg81kD6fw/aynY=;
 b=kdodkBFaFYQTkcm4sIK6P8IJ7hA+1I5TjeFWRRPBW3ebdxcfpPG/kSSfV1/h5sUrPd
 6IfJLU5xrd2HSs+lWcqrZrVcaRDOinQKZZn8GDQczp5zpqLy1xthyh6rXuJY/qnnZoJi
 da3ceM6mpai7gwoAi/bJAcXHS13RL/yUJnvSJmcxpkC6T2Qs+EcrXxzf5Y0o9KIqR8R4
 C+pc3205LHWpwYKf78aHL8KdhxFO+pxp1ljccr/7k0eigt2egCuUzapGoDipvbcL8fMz
 RveoJn5fmsQd1SInwgwXk7Ioudoujt4IoUF4z1/t/nIuJExE7Vnhrx5GIZ8x92BUJtiY
 Is6g==
X-Gm-Message-State: AGi0Pubpkl60M6yf2AejDnxZPSChwPdwDzySeoVlvZFttNWdX9ot5yIi
 J20k7Z1i6jAhnib5CdxoNBODUdVOZ7JomgXZDhRFhQ==
X-Received: by 2002:aca:3441:: with SMTP id b62mr13876728oia.146.1587993817302; 
 Mon, 27 Apr 2020 06:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200423124305.14718-1-f4bug@amsat.org>
 <CABoDooOz7MZ6DWajfQU1s3mK8Cf_U06pjHcoPW9Tat5+gKGdGw@mail.gmail.com>
In-Reply-To: <CABoDooOz7MZ6DWajfQU1s3mK8Cf_U06pjHcoPW9Tat5+gKGdGw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 14:23:26 +0100
Message-ID: <CAFEAcA84BLBndhMZ+fub-Ss2Zm-Qmgv+3nUzMgC3A5=ipTp-Ow@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 MIDR_EL1
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IkhB55TMVFIU

On Thu, 23 Apr 2020 at 14:08, Laurent Desnogues
<laurent.desnogues@gmail.com> wrote:
> On Thu, Apr 23, 2020 at 2:44 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > MIDR_EL1 is a 32-bit register.
>
> In fact MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.
>
> So the right fix might be to change midr field size, just to be future pr=
oof :-)

Yes, I think I prefer changing the midr field size. Looking at the
code this should just be a matter of updating the 'uint32_t midr' in
the CPU struct to 'uint64_t midr' and changing the
DEFINE_PROP_UINT32("midr",...)
in cpu.c to UINT64. (The one user of the property in xlnx-zynqmp.c
doesn't need to change because object_property_set_int() works on
both 32-bit and 64-bit integer properties.)

Mostly we have been fixing up these ID register field size values as
we move them from being top-level ARMCPU fields to being in the
ARMISARegisters struct, but I think midr is unlikely to ever need
to move there because no CPU feature is gated on the MIDR value.

thanks
-- PMM
