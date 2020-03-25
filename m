Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1084843lfi;
        Wed, 25 Mar 2020 14:11:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuLY/IMVkULVsvKgPAW32NRMIe1K6iKQ8URTmhhv1mtgEVjQMRdQyAFysWn8c8+wLwaH+8q
X-Received: by 2002:ac8:4c8a:: with SMTP id j10mr5061489qtv.69.1585170701800;
        Wed, 25 Mar 2020 14:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585170701; cv=none;
        d=google.com; s=arc-20160816;
        b=LiDu4wFPqD27vUBsmBwqDPhqcu5gi/9Dx17jeSxUkaL9IcL1u3lQ1cqG2mhMJIk/O8
         1rnLT3PHNO3cKf9/oSbXxI+Tip8qmkOBki+UZGQQXzm3XCwuPTEd/tQx5YP/l08tf/CF
         J2XLfXS5oG8JDHqOg8EeB9tRpmmMv59T5x3e6hq1zbqkJtHuJwt8cHRkHQRvkemeyws6
         OHz8TpwYF+PtbKOQNxZf5CjDLQJSkHX08rfzncN9DJyu6dds9b0dZelBlfN2Eor1CEb1
         GK/IwMlURkzSJN79UdSzxHPPtoPBoF9QhiaJESB58axUE6Yk1zpK4Su8Dt8H5+OoyEJb
         mM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAs1/6rPZ7AOg4acfSkSNCqbuVv1mxi1YhxZHMCYXCs=;
        b=OpVVE2gEVz6aBvonz2B8BrdAb2jAiaqKtY7te4KQ8qAW837BM+Wzq8nJqx9W4GlSsu
         UbRToiSR4mGQLLZIstjc8oejssKDbW9gYOa5FjRCUazotdAPXAAY5o8/SRUwK1Il79yn
         CvE4eVmcQVStu1aD+gief8c+f7odO264+fmZ2Sp2TyQeq5fTtSBq1WtYTOq6jsW/kUoP
         FOqHTGEJWHREiCABhb8OKcnVRnuaNyD/WSW/1a/Vzeg84hJM+DeHDl9ooOcRVv2O8fK9
         6Ku48ALW3l8km6cUje6aGvJcWc6XsRlufvrhPGf+BRvSkvhUfYCMwjqGaQJzpAG51Xvg
         4ffQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LU+Owh/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si8278270qko.246.2020.03.25.14.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 14:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LU+Owh/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHDJN-000497-7M
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 17:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHDJ8-00048d-Js
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 17:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHDJ7-0002dz-AZ
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 17:11:26 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45865)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHDJ6-0002cm-Qu
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 17:11:25 -0400
Received: by mail-oi1-x242.google.com with SMTP id l22so3495924oii.12
 for <qemu-arm@nongnu.org>; Wed, 25 Mar 2020 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pAs1/6rPZ7AOg4acfSkSNCqbuVv1mxi1YhxZHMCYXCs=;
 b=LU+Owh/txCIjf2uUpSQyaD5hsuVhTkSdf6JPycZ0mzUldMAL/BSwx+H/pEP3bgRFTr
 PdjOnFPDrprrAcxnmir24bfvxaHfaRkV4oY9VWx3V3s/F3gCw+YdJ5hzK0cJz+zO4S/T
 P9Wyh4/XOYkvskqcPIBgvOod5emnhw7wyiwlI5g/locN5V1qtBgnge9JHlEeGqTX65pZ
 T55luqaSkw2LHYFy7gxywNxocIA6wYQCQZEDXMu8TdiA5SfTfBD4SOv3LySiMk22l9xO
 NCT9S/WPMgHICSbRQWnZeOh1CK7P8e1oh9LTrpyR7zG2jKIVTPOMIyL6LXzVszfzT0HG
 PvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAs1/6rPZ7AOg4acfSkSNCqbuVv1mxi1YhxZHMCYXCs=;
 b=BQ/3aq+HUk92VTNXD07pvAlXV/K34/EGyQ4kiGUJ2SNOdMlqIZe52ReflHondq2eBt
 WzPiETciXRwhHgYuGaxtCnuqeCHVj3fyRrFcijSIdQl3wPGh/RaMZZzbGJ6OBqODDWJm
 W9j6lZ0w7uDP9eQIBRj8qz/7zbAVlgLHhLk73P9eTQJpZILNSkaJiTLEUKCx4bojWfSW
 2PTByjcMA6hPSyc+rum6Rr/qYCoXXzEJskw4Ii/0p0AXdQHAloIyR6ZrPZvCYI7Jetda
 HP1LNRLQMIia/6TDYNC0+kODtZCb0mahtubHEb+QFlCT6jw8+jdGZNblLcPbXbp5T/Ys
 ruPA==
X-Gm-Message-State: ANhLgQ0rZcGoSm0zZoMYMZdAVlqNnHzuxuD0I+vzeTIF3l0Ebk8i9evA
 UY3hbXCeiTc7l/A6AcbpSCWglR/OdLyCiURLNDX3QQ==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr3824023oih.146.1585170683403; 
 Wed, 25 Mar 2020 14:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200324212103.7616-1-peter.maydell@linaro.org>
 <CAPan3Wpr_ys2qZ_kTZPYyc3qfpvqPdhnDj6VYdbei8Y0_uTG2g@mail.gmail.com>
In-Reply-To: <CAPan3Wpr_ys2qZ_kTZPYyc3qfpvqPdhnDj6VYdbei8Y0_uTG2g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Mar 2020 21:11:11 +0000
Message-ID: <CAFEAcA_LaX19=wZRxP7YvATUVbJNQjCBSdGy13b7AhQPxpCPMQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac.c: Fix REG_ADDR_HIGH/LOW reads
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o4DdrFjq9wTh

On Wed, 25 Mar 2020 at 21:03, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> By the way, is the coverity output of master publically available by any chance?

We use the public 'coverity scan' service:
https://scan.coverity.com/projects/qemu
You can create an account and look at the defects if you
like, but we don't generally expect everybody to do that.
Some of us tend to triage new issues as they come in and
report the non-false-positives to the list.

thanks
-- PMM
