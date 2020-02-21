Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1866381lfg;
        Fri, 21 Feb 2020 06:27:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpW7qRrsmNQuMXaH0aDyBZxGASxhB8RH9DSdONlgtTu66gVd01UXL3cPE7tLnNernqhK8Z
X-Received: by 2002:a05:6214:7cd:: with SMTP id bb13mr11829597qvb.241.1582295267848;
        Fri, 21 Feb 2020 06:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582295267; cv=none;
        d=google.com; s=arc-20160816;
        b=vZo8zdJDwHfUffOQBcgW4MG0mHoKkfDIj3elbKDJviPW0IGHUV3y+VXm7nY2MXVTdG
         NndNPmVhdiManLEVCcZ5r1B2w5yRp0RX4xBMFalmD6VJRJegy79qLIapypwB/iTt4Uzv
         etbRCc1X0zST2lpz8cN2yn8EB9niq9TvjzAyb67dR7PekDCOjs01SBc7Q993ejcTdtCD
         OenCLjmE5WwRgj5AiN4pw2o3y7MAqXx7skxawirj9mYZWdpmn6kZVvjB5uqDTWREP5nl
         9MkVuCzkYcfwDA+b/1mfalkCVFHduh3UCA64W1k2/qgwpBw+ib5RHbAEj8iZq85MUSkm
         yJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwOOFWB4szt5rdkEHn9Rc5Bmej30A0hc7MSMzaS5f8o=;
        b=QmKlWmhrUZu4EgRoMbW50emVSdPIsrrv9D0EETq2HgxfydIKojsBhGxbf68CkBxReV
         gHeveBKma08avwZa5m+ZqGdTVPfjnQhX/bzhaZhdLJ7L9g7f2KIfD7XibSCm8CjytKh3
         ivE0pksbBAiGXJVBm6ZYN99Tpkely9IWL/Czt05BY3YjT4Ezapho+ARQLnxPpc/BaTZt
         3qUc2t9BDX+yw7dQQ9i04ndpWygGzbkWfiOImfMo0iUKuS0lOZLEjnj1JEPAo+phS0V0
         3ZWl8Tf8/5xHVG41PgSRKVCpySduBser3mMpLow5p69+VrK5zegBC4x/CaywF3+IQSyu
         DF3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hWwuuBGD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si1391375qvf.114.2020.02.21.06.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 06:27:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hWwuuBGD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j59HP-0000rD-A5
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 09:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j59Fg-0007oz-Rr
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 09:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j59Ff-0005Rv-R0
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 09:26:00 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j59Ff-0005QH-Mg
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 09:25:59 -0500
Received: by mail-oi1-x241.google.com with SMTP id v19so1697711oic.12
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 06:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nwOOFWB4szt5rdkEHn9Rc5Bmej30A0hc7MSMzaS5f8o=;
 b=hWwuuBGDynGYGhkITvGpv2BKN2eEo7xP3j0CxsofCUfphwaO7hf0J+LlE+3/nnbujx
 m1rmdE5nQjXuToGXGhCuM3rRuU7Uxk6rEFkwWU1is+SbXlpPAht2y23vrxrDeZCjO5jw
 5RUrMqCak0Nsu4ue+WWm5xq7wQm66lAM0mhrmVpYHo9VDSSWlKSQ4FBpzuv2/D0VSOm8
 wJpN9viSsDa1LdU8lr1hcXGpV8hu/M2mWyi0Scli7TTRM9FFAuDPkwwtLddJYZUE9q8u
 u8BE7Ru25APtujSD7sF4mmu5WzmhbgSpZvExfmnbWyzYtoqibWUWrbK9j29t/qPzXT9o
 4TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nwOOFWB4szt5rdkEHn9Rc5Bmej30A0hc7MSMzaS5f8o=;
 b=FEQi5lsMU1uh0MOjZt467MlNkfi/AmmBIQ8hDhTv+6e4XclfVAn8CzvDFaT2MmZQDi
 UUFHj/KJKywGlTRNeuXqGON4mYZbDbw3gwU7vD/obMiAzYm4dRwMySKwruGvh5T5BpM8
 mrOpc9eX3nIT++owj6gIXSxzY0Q7N9v9sdPtutrJE4CZE2ksnGJWhgm0vcoBnLVpSMJa
 lApVcLrzs/IK0RSoX+neyCpB226uV+eNlBf8NDPl3jxrfoLaE0QzipDZOgtxrLV+oJxw
 U6zHPgjhOVn8C8e+1wbisvhcfkoJ+6IilJa0+qtfRI0XW9oELpvQOlpO8OdF1f9ftZAw
 SEvg==
X-Gm-Message-State: APjAAAU4R20tb3O9bHvFRGbe0p7RiYGB+HRVHH3tcQGQPer56qTKs2yX
 6HHm18oHUB/CNZ4YZAFPvs3+VLXL+BG2GXUI0yjfBQ==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2152171oic.48.1582295158721; 
 Fri, 21 Feb 2020 06:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200214132745.23392-10-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-10-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 14:25:47 +0000
Message-ID: <CAFEAcA8f=L_YJFukTk+wKBODBYh7nk8XCUfpDk7ywCCu6m6V0A@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] hw/arm/virt: Add the virtio-iommu device tree
 mappings
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, tnowicki@marvell.com,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f5Kdr+wjNyq/

On Fri, 14 Feb 2020 at 13:29, Eric Auger <eric.auger@redhat.com> wrote:
>
> Adds the "virtio,pci-iommu" node in the host bridge node and
> the RID mapping, excluding the IOMMU RID.
>
> This is done in the virtio-iommu-pci hotplug handler which
> gets called only if no firmware is loaded or if -no-acpi is
> passed on the command line. As non DT integration is
> not yet supported by the kernel we must make sure we
> are in DT mode. This limitation will be removed as soon
> as the topology description feature gets supported.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
