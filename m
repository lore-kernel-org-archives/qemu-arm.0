Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6047877lff;
        Tue, 10 Dec 2019 08:33:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSQCNVE+TE95RHqIDT8mGOd59Nb5Oz+wwA9Izz5XFHMLKvUhC+/eKgyiIPhRC61dp6wkjN
X-Received: by 2002:a37:a406:: with SMTP id n6mr5194856qke.63.1575995613749;
        Tue, 10 Dec 2019 08:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575995613; cv=none;
        d=google.com; s=arc-20160816;
        b=QZ/p301JywszBASIh7bM6xvf2sonp82th0KQ3owOvo5mKsr2ESqCbEzAYI56MDNHdN
         iOfIXaIqAPJIdocRtmi1Fh6R3V8xl4zzSTIPI6ZWsYWFp07dWTD3u9SV/Z9Ky4UEIFE5
         WFB5DMPd8QekX8R8fPLv8UPLnr6gtaTSDtZ7y4SFXaXbhUwxhZuIr16s9AHaXjHiXRMT
         BS3YVZAo9e2MzQ7Ug+LUMmT5Y2+UNFddbyd7AuG61No7DztjeajMhlkQWv3Dk4z30IhA
         C7Y4wQeyJP+bVBcY6wkHbE2kKGiNES6pF7Bz+iki0GKDp3IxS9zhgIidZC44lhgMVOct
         ZzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=qgVznmekNB3MfWLf8bBgjLOIH1R7Lmqq4nQfM+upz3U=;
        b=L1/+NPNZVDFPMykXNIS9Pg2SsSthSnttMTbLlsJhTosLiaAOOFymiqFiN6sGaObmVQ
         q4BD4s4FQApJKGMK6j5c8BWIR/HOOkNLSc28pF7QcIcEZEUE5RW9F/ApOc39Zz1+MIc2
         i57oyFmWIVbzJeAiFCnWrSfotYgQ8ryOZYbb6eL0iT4cTfFjAJCLJym/xgMHGFQnaC2I
         ImQKe0v4rN229RbLOyb9hlipbndg14zNkKCXGZqnVoS5nID/wpGGd80s7H7c9MPM+QO1
         VGGa9lsmyZ8r2VzvXTGWmELou5yAWslvUfH+HW4BzLWN+ADX+JSbQMG63G0Mr+2EogG2
         hLfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2qqHrXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si2264040qtc.65.2019.12.10.08.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:33:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2qqHrXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiS4-000058-Ej
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiRF-0007nn-GH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:32:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiRD-0007zv-G4
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:32:41 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38441)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieiRD-0007zC-AB
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:32:39 -0500
Received: by mail-wm1-x344.google.com with SMTP id p17so3904870wmi.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qgVznmekNB3MfWLf8bBgjLOIH1R7Lmqq4nQfM+upz3U=;
 b=k2qqHrXpr77w0dy+IsuoZDZBR/zO1WWMkmuM0lgyEBcYt9nGmQFMIP0tKz7vAakfPl
 mj6EEnUORMrkxg1qYTKoAazJMitEMrlle4erVE86cUl7DPGfuUAGqBiqdPNF1K/LfJF+
 P4dmS1Bv1PLgJ7bdMv7iZOeUU1/Ex90kE6EkFf6eSgkovI0HowIC/TGoqP+Uj/0Y2m+Z
 USuRSdzIWqMKIIf5IwAWRTGPFnHtH233VgOwvj8mkK9nv2jJq3vx5z4UIC3j9TrzSaIY
 9fWjHx8MXWKTQUc5DpkTy4jc81F1k8P+MHc+hHlOCT/bx4kgQkb0nvGN5vDPv1UnDiAL
 hstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qgVznmekNB3MfWLf8bBgjLOIH1R7Lmqq4nQfM+upz3U=;
 b=Qt13MywR3VQEecV64XkElqF3tWwirnsbsUhYwo8YL1viH9a6DKf6NJg4nNtMYtaLzA
 hIXFox9OtxAa+GRpQkR9olqoy20TMaU4FWPeAK3ohs1jjs98N1UFu9vAots/M2Ez4lHI
 tnk0NLjYU9qYHKkxQQ9h1eFtF9L0rNaV/VNH6Thmh+A6sMJ4LE5M/dQoXshhuF93Wsev
 4dBmOeUNeHxXXfxHQPIfTiEzCh0wcFao3YPfnOihNf3eGbYpBI0zT0SsJ6sWDAttPKfS
 /dstnXRVDqzI+UMb422P0Z9afn5K+3iY4HdLDy7MabZOO1BlNe2vwRVa5zgbIBdPxF7F
 Yt9g==
X-Gm-Message-State: APjAAAVvW77uZ/BWkDyOgzoo9DgEuhefl1+i7vI+5eZNKIgrvD8ksa8D
 ciomiEsrakcWxXMnYNqtE7/FGw==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr6485530wmo.147.1575995557913; 
 Tue, 10 Dec 2019 08:32:37 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id u10sm3615307wmd.1.2019.12.10.08.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:32:37 -0800 (PST)
Date: Tue, 10 Dec 2019 17:32:33 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 03/20] virtio-iommu: Decode the command payload
Message-ID: <20191210163233.GB277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-4-eric.auger@redhat.com>
X-TUID: 7quYRLZG0lrg
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>

On Fri, Nov 22, 2019 at 07:29:26PM +0100, Eric Auger wrote:
> This patch adds the command payload decoding and
> introduces the functions that will do the actual
> command handling. Those functions are not yet implemented.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Which isn't worth much since I don't have prior QEMU experience but I did
stare at this code for a while and work on future extensions.

Thanks,
Jean

