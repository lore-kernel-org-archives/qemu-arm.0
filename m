Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp275399lfb;
        Mon, 4 May 2020 03:07:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypKHN2OI76MK49qwryqunkpm88uDD6SKWRu+95wPW/c51vjjvFAWS04772/GSOtmqBcYYlUO
X-Received: by 2002:ad4:4e4d:: with SMTP id eb13mr15201036qvb.169.1588586829705;
        Mon, 04 May 2020 03:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588586829; cv=none;
        d=google.com; s=arc-20160816;
        b=b3w9Naw3FUOwYAy56DBfg6XAhOhTYZo+8gNu7m/TJn6jIsUUbp0DmZeQO5fW45SLgw
         f2UirX5le3mOJqIQVtT+z+BUbHC+RKHXB8QuvfSxnOh5OpP1OYFEoVXfx5LD3GxZY1yM
         T8XKYvxaT4+Q4K30dObFRNfqRWFPHRQ9DHSclN6bbmy8hiMWOqYSMS6h4oKeALc6tuy4
         WW3bUO+AxMEULVajm51ZIhX/PW6l1sWein5lBm0sdlUlNRt4MbT/Ew8FkN8ugpZcTNCf
         U7wsq2YbNy68KDCIQKhSvo0GIhsTlgmAii8vI11Sq23ZivOnM4ZnfUWpsmdhDQcqHKG5
         gtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIEX/w3bf0cjwHgdmYdRZ0vsBANcQ731ZClQImQnZFQ=;
        b=IZCgADbV+Vu1lhZNd4Tymmxg0yBNXU1ZwR3fXbXntzTt9VoP5q5PNu6hbTezXR02ij
         b4vZcSlZBFMN4R3eUf57bwcve+GjMwjT5GrRbL80821nzaLQ9uXQ0mBwhJymWg842Mwj
         7KL/yPk/6eGZ7eEwjrYE7VTfGH12/BtomSbUFdeYa63MV6lZsM0Wfne40k15IxJBH76X
         POUru+9AeYP6Hj05gVsPEr0/7SE61CdCuVW6CumiU8xKpKla6I74iHBmy90CuuQZUrsJ
         zXMZooXrQNUOW5C+ypNHzMIvmjvBBiezku4KRyIApTiSRQVpldvOzw6yUjsRAEHC+saV
         Wy6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmlMoNfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a12si6130569qkg.369.2020.05.04.03.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 03:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmlMoNfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVY0D-000489-5y
	for alex.bennee@linaro.org; Mon, 04 May 2020 06:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVY05-000463-Fg
 for qemu-arm@nongnu.org; Mon, 04 May 2020 06:07:01 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVY04-0002dW-Hf
 for qemu-arm@nongnu.org; Mon, 04 May 2020 06:07:01 -0400
Received: by mail-oi1-x243.google.com with SMTP id r66so6159927oie.5
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIEX/w3bf0cjwHgdmYdRZ0vsBANcQ731ZClQImQnZFQ=;
 b=jmlMoNfEGDfF5YztKd5upH0jQSYcUCavmoNGSnX/gyfElzwAVi19iNonl57SSjdRB4
 rDsXttR/+vCWiDjev0vYbdb1pVfh0aemIC6qM72oRed6jkN18wQuuMbjvsrjKK3c3nsc
 +yDAKics1mgyzGPrHWqybc/TINy1H8mBFju14UXavz/U9ATe6OZkdPNXZTjZSJ59EtlG
 LYbdLAK/7kuacVoJ9JdoACMyg/yGBG00OAHWqv/okXpRpBlE1gTwkmJpyltcu9DROd9G
 wHgrt3ujCIR0jwbcIgR6Plzjz2kt8t6YxHshHWlbD+82zQDHDb7xVhtc+UPLACEJrut0
 ZTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIEX/w3bf0cjwHgdmYdRZ0vsBANcQ731ZClQImQnZFQ=;
 b=gycsmnHH+DdP0sH4pvrAmqfVlHylNduj4U3EKSrq7f58HafPjodRugki7ncTLPAgQH
 75l1v9dWiPP+Bacuxmu6ruJyF4egIVIqR69n9B34chyRaBCjqntMCJB7UYdy97nxvgXa
 XeKpJzkusUjov4/i2aIPZcwHmCSqPY573x/0GMAFqdiqQDE98E5Y8zvFTtCMUmNYX4sf
 PnloHs7BNpj6LY8Glhk59r8a2lPRhbDDSnjxoqak2TZobV5+9axHU4N/JscbkPci6KUd
 XQT7Adrp57eJa6JpMe1OlnIpnpFIBdrn4HGFk8fJYJ1FUr+gzoCK/3uX/T12V7T+qfsG
 IWsA==
X-Gm-Message-State: AGi0PuaR3R0Q4xIkOA5njkX0HzRgb3ibcsmmDK1hF8t8aLRqEtbWGyrl
 uLT4yvUmzpCI5MWVrv4P/tjti7cuh92XCJrMo3lmtw==
X-Received: by 2002:aca:3441:: with SMTP id b62mr7934429oia.146.1588586819285; 
 Mon, 04 May 2020 03:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
 <158748197516.25490.13137194821077838492@39012742ff91>
 <20200504055608-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200504055608-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 11:06:48 +0100
Message-ID: <CAFEAcA_VGtbjpVTb1VE1XCT43JODjkW8o1zSsVmzO3fg1+fr+w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] ARM virt: Add NVDIMM support
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 prime.zeng@hisilicon.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: anuwoWZhe+tH

On Mon, 4 May 2020 at 10:57, Michael S. Tsirkin <mst@redhat.com> wrote:

> > ./scripts/checkpatch.pl --mailback base..

> > 2/7 Checking commit 5554e78b18ea (nvdimm: Use configurable ACPI IO base and size)
> > ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/qtest/bios-tables-test-allowed-diff.h and hw/acpi/nvdimm.c found
>
> This beats me. Where did we get
> tests/qtest/bios-tables-test-allowed-diff.h from?
> It's a different patch, isn't it?

Ah, this is a bug in the checkfilename() function -- it uses
some globals $acpi_testexpected and $acpi_nontestexpected, but
there is no code to reset these when checkpatch starts checking
a new patch. So if you only check one patch in a checkpatch run
(eg by just passing it a single patch file) then it will work, but if
a single checkpatch execution is checking several commits
(eg in the way patchew runs it to check the whole series of
git commits at once, or if you pass it several patch files) then
it will give wrong results for the second and later patches.
I think the variables need to be reset at the top of 'sub process()'.

thanks
-- PMM
