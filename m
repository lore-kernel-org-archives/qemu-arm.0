Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2618917wrs;
        Mon, 19 Aug 2019 05:56:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9/GIH28T5Z0EvEbTVxr5f59rG17V7KktEci9u3704bLbNR3Zon0WnMVcc3oxoeKzEUFFS
X-Received: by 2002:a50:ad4f:: with SMTP id z15mr25096979edc.188.1566219369529;
        Mon, 19 Aug 2019 05:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566219369; cv=none;
        d=google.com; s=arc-20160816;
        b=bHb8FuhaUjn6qJPGSc7pj7ogfDezGvWssNxgyJSOb7ORYavYbfPtIW7cC/mxYy0U+k
         k+JKEo/bQtSlOv4eHkP4KBxz0XwJwwbK80f9M6sleE8eBpKrDt5gmOKJrkmUi7DNdE4u
         j1epTLhiVXUy2f+7kqwYiK81kDksZlWbGGztoIGLU7HrFDY1CjPBwOmspH4wcwui3L96
         5mF/ZUJuEs09ti0zjb/SNP4QCaUJ7pK1FjGqsDLkFO7dNi1V7ile8dHsVYYkJuz6ZYO9
         RlECO8ftc7ieVnkaqYEqVgAfocuAkHCmxn21TXBQcWmrh/YbYqh1ay1F01ubqjhTFuxx
         IdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=VX59h7cYMfm7tHfMNYleY8XgaDwvKlk0BYd+QJymBwk=;
        b=i9TSGA4uo17ZmKgH8u3N4qrAN6ABO18QInoI91AsKggbevgRY4bDB/rsYtwcJo7yHh
         0Jn2uazGYGa2yyeYrE73RUmkWYuqiFYmW+PHmBnJ5Zzu+vHyKKUR2KUiHZYGQgAkHINN
         CSZ8slUv5R2x6j5032PZ1Lrr3lrWgrdQ1ST+6EhlTtOJMv+5JcSCKuc30eDun0MT85Rm
         6vT96lGfhPMBE2Kd6ZnaaSArmeSH2QYPJLXY22Jlht/Me/z3vLxf3s7QslK7+NhbT5gX
         MtfaSmXXaajG0A1Oa0s68xyEFtP7NdmAt296jmfgbJYf0/XVMMPF5EMKnE7PU+kYHkb2
         3YaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si6962656eja.60.2019.08.19.05.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 05:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzhCh-0000iz-TM
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 08:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hzh1q-0005ft-1R
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:44:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hzh1o-0003p3-Iu
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:44:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hzh1o-0003oP-7W
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:44:52 -0400
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8DCFA62E9A
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 12:44:51 +0000 (UTC)
Received: by mail-pg1-f198.google.com with SMTP id h3so2501210pgc.19
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 05:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VX59h7cYMfm7tHfMNYleY8XgaDwvKlk0BYd+QJymBwk=;
 b=G3mZr+4EpmXIEznRz9WHvXH11L/XkkXttLPJibugM8LaUq3fZo8xfwr6og2Ktb8P03
 gf5BybdhEPkcEnW/UC1v8HF4TAMXs80cMoku6Hq4Tq010NGRXHXsA7URtzUJKNayZ5RS
 y1uIwg5+MbKKo7noDDH203OEZycrfqB1TMRqqMP04Hw4nL19rSjeziMk1ZE2VDcS5Iwi
 ngoRV8LmzMyyf/84e0pucXOiiTg+5FpmE8pJEnHkXBXEikmqw+APEVrhgFVPFLSOeycI
 zT8e9h2MIpfOGU5pDeTiKP11lAa0bO4GEke88WMrUChHLp5uvbUJjie7QTPn6akDr/VP
 Koqw==
X-Gm-Message-State: APjAAAVm80Mi4HUUZUDbg6OexcM9WlG39GUvEUuCwxloQdc5vmI5Ch7/
 7kfhH6k4iwnAJI+q9IV/g4r7jx8MLHXVU1seYLHYzUXkEnL283/h7EniZ50eeIQyMAtLeqi7FZs
 WT3fnJzKYy4Kk
X-Received: by 2002:a17:902:2ae9:: with SMTP id
 j96mr12769968plb.10.1566218691147; 
 Mon, 19 Aug 2019 05:44:51 -0700 (PDT)
X-Received: by 2002:a17:902:2ae9:: with SMTP id
 j96mr12769951plb.10.1566218690954; 
 Mon, 19 Aug 2019 05:44:50 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v18sm16431169pgl.87.2019.08.19.05.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 05:44:50 -0700 (PDT)
Date: Mon, 19 Aug 2019 20:44:38 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190819124438.GE13560@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-14-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-14-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 13/15] virtio_iommu: Handle
 reserved regions in translation process
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26ZmS5Hno/Ih

On Tue, Jul 30, 2019 at 07:21:35PM +0200, Eric Auger wrote:
> When translating an address we need to check if it belongs to
> a reserved virtual address range. If it does, there are 2 cases:
> 
> - it belongs to a RESERVED region: the guest should neither use
>   this address in a MAP not instruct the end-point to DMA on
>   them. We report an error
> 
> - It belongs to an MSI region: we bypass the translation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
