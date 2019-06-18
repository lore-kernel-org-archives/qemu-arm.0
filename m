Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3695000wrg;
        Tue, 18 Jun 2019 05:58:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwd3173E9vFxCF5TVhoEF863v5O8PvjSst2xP3VS8Lm7zOFuYavP8iazyj83KCyV4MreZbh
X-Received: by 2002:a17:906:2341:: with SMTP id m1mr101760050eja.165.1560862698704;
        Tue, 18 Jun 2019 05:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560862698; cv=none;
        d=google.com; s=arc-20160816;
        b=uDLBhscWtbvoY+yQQb52vj5xqhBjN0ZzOtVzi/kf8mLvYpnXNM4g7lkK2sOsg8YaT8
         /KI9F4cHQ9fEqljbnLYwW65g4pkxTrn+0+DjXbU79MSIfZEcvdmksXcjRNmwTPl4ahaz
         tPsX7mYkHbpQ5GVmrpuaUrT7iTaO5sT2vgqBVjsqlofDg0ox9OjB/0ui5rOxsVFdxUXs
         W5UPSOQo0HSXwXMXfQaAluhcVsukUYY2sWs+LzyPVzQ+ThY+woYrj2oYrUz4OthggIjm
         6qN1/DUGel9TkGvlc9gLV0GZXiWg+D4oQb3iKS0UPfSijCv5z+CGOuQ+vP3ueBZeqGAt
         nLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AVbzcOczRMrVgHkbxqpowgYHCdbPmqOBLqODOt+rms=;
        b=gVMISuYcn2FRj6mj8XzQmHLWBkXs/H9KS4pdwn97c6gzDVLhCMUhHVAgDTCxUO5LfG
         F3PHglyR9Yz1r5GGFWvGnIMO56oJkFwHVf7/eTucSIA/qmaEc3BD1VYNicAh42dG2/9p
         m+jfDqETbe7WvMbk2jFhHjNmyUhGQxX6mucxrDzaoTlQEQfwuhTz5rSHn23Z39BPkaAK
         7RwhKACxkaAJqhhY8GDFI5viMlbVVP1TMAj2G4Z+LfrZjejKUtZ0ZCztn/h/+wC136cG
         E84keM6VOLbAmYWJ5j9jIrO18NPb7RuE92B2K1gi4I8SFpvXanUnRGuja6BM70SqeDsI
         fzxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FhlQYGWF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si3491031edi.96.2019.06.18.05.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 05:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FhlQYGWF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdDgn-0002kA-RT
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 08:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hdDge-0002jN-C5
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hdDgd-00058O-Iz
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:58:08 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hdDgd-00056g-AQ
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:58:07 -0400
Received: by mail-ot1-x343.google.com with SMTP id z23so14348580ote.13
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AVbzcOczRMrVgHkbxqpowgYHCdbPmqOBLqODOt+rms=;
 b=FhlQYGWFqVigp63ePytQf7yuIVA7fqvVLy6WQrohPVzSqXUbb7+V4/82/CTb7MxDIv
 j351FtyVbWooZGAw2w6wV0VTQAX+TyYJegJDKAcu6q7A6ZB0I6S/GRpY3if7xMSu14zi
 LYGlod2senzJU4JDEIufovjy2SePOBsNAJyP44es6C33grppTyEB1xpdQBpIuC31wmUm
 ADlZ73zdAkLM4j8Qk2jA8nHIwEsKBwHnR1gmY8vrsiE6Vq3UH9r4NfXyvBfMH94rwU0a
 FvPmeJykUwFC1sdaO16Hldr2EpaSwLq5M5Kk5hMMKPXxd9rwWYOz9R4On4Cjm0qEyKIa
 1wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AVbzcOczRMrVgHkbxqpowgYHCdbPmqOBLqODOt+rms=;
 b=p1J3RK36TIR8lsTDGHw6iqW7KK4YYS195S07d1hFZYOECWb4PoUAGWIhGVx9IiTRvf
 h4IC40mAksuMvglOGTaEwLeGMyxYkBjPkuvM5bk+3TfdC7yQa6q3OjMvI2inRPP8g18S
 N5TFTLV67d1U5KuqxBurWJNC1XVOxG/XklOD5qH+fnif/YwcLMIVG/zMrPy74UF1zHhI
 QzURfJBOVXdIDjzv1SIsnlUim1t4vuaxw981MDqbIi307e3dyFpv+9RXmcx6nCWXbh8G
 RR2rHljF+IRmMgoFQvNFnLkY5gCnReqxfbL2owyda3PLsqpjxtUuAga0ztGTLooemqIP
 Ds7g==
X-Gm-Message-State: APjAAAWOEHmCRSdhrLvib2q8VQyBgXoZksw6w5qFIxILkSWxt3Mg4zdE
 Ufs+oXkgVjdqmf2NsgOM5jSaRNVcqOEVmW+gsFk/Jg==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr4554988otj.97.1560862686500; 
 Tue, 18 Jun 2019 05:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <653a6b3c-ac1a-f197-1240-a28f59890fa8@redhat.com>
In-Reply-To: <653a6b3c-ac1a-f197-1240-a28f59890fa8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 13:57:55 +0100
Message-ID: <CAFEAcA9g=9u1Cj+1gqWqXWfg1phmZPw4=y7Ks_EzbYOEBW-WOA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v5 0/8] ARM virt: ACPI memory hotplug
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 35d+0wPK1t6j

On Tue, 18 Jun 2019 at 13:52, Auger Eric <eric.auger@redhat.com> wrote:
> Feel free to add my T-b on next version:
> Tested-by: Eric Auger <eric.auger@redhat.com>

I'm not sure we should carry across Tested-by tags like that: any
respin might accidentally introduce bugs that make it stop working...

thanks
-- PMM
