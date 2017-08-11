Received: by 10.25.221.202 with SMTP id w71csp1325472lfi;
        Fri, 11 Aug 2017 13:01:41 -0700 (PDT)
X-Received: by 10.200.9.47 with SMTP id t44mr21854932qth.16.1502481701172;
        Fri, 11 Aug 2017 13:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502481701; cv=none;
        d=google.com; s=arc-20160816;
        b=zY7+qD31NVqU0rvxTeAdU/mU/nZSiyghObGCHu3SoPYjOYCyTPTU54FaLcltZYhUQh
         mAxj0D+KkkuGpMZMMqlU+CIi8oFIQBi9huwY1EZGS0d0H88oSme/OtjAaJtG3Ld+TZ8Y
         EdpBhaBs+SvpwjulaZBOp/u4wrKXGB3T44OgY391RsbCtV1ER667pqutVjtVxiobABGF
         /ccdMKkNVQSMUJiOd4vfpmPUynwfKjQd3Zn4m6y1u4GTXTCFWr0wxrrvrVBID2P7bhMe
         3oYMsQ+utWbMJNFC/z10Svn0OqoT+7s1Nl2zj3pYR6UPjXvAHrnIzdrAoZVvtxY9U4bD
         EmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=72TKMmSqFRHZNaK3PxSAvbtyjQLVTh6p7/GDx78jpKs=;
        b=XxQQ7ngNlF6b79zl5SX/SdAmlEjCiCHRltUzi53pM9tlmg7Fw/BWgtLYyHHD8tZSMv
         Yb6TKu6BOvJPBJFCBp/OHtQvFAMQTpaxAK5FKCWTBRpQ9hEMmIdR2Wacy5vwXAfoorcj
         HYuxI6b3bwWFnRo96KyjUoC5MvhTvQCrSF6cshDrBvCx6M85BmcRiDcHHVrnsE8tI9+v
         kihbDwtyefZkLBQH9K4YPWywyG0MP6AqEW1YNmVpYKHiLINtYKH2LENIGNKWvybCRrKI
         A4Jp9dkW4l4Jf88ptXLfrxjiJpaceCd62EWl3WSyUXFvqFyNaZigiy+fq2EUuHi9R+L7
         7x4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QXYW5sgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z188si1440026qke.49.2017.08.11.13.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QXYW5sgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgG7m-0003uu-GC
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:01:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgG6l-0003DK-4e
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgG6i-0002wH-1P
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:00:35 -0400
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:36469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgG6h-0002vu-RO
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:00:31 -0400
Received: by mail-pf0-x230.google.com with SMTP id c28so19612208pfe.3
	for <qemu-arm@nongnu.org>; Fri, 11 Aug 2017 13:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=72TKMmSqFRHZNaK3PxSAvbtyjQLVTh6p7/GDx78jpKs=;
	b=QXYW5sgo+54f0bVr17BMF++OLRhJPFJiMWlJDxm/9Lh6zF2bM86HHSN4rN8N6NNKB7
	OKk8cnxaVabjtQvo8sqyIw2/4RAAa9upBf2DaIk8sVFBYMONaQwA6V8u3PNq2Iiv3qaT
	04UJ/LeCAs8nKl0EmfGZsg1j2w6T/iy8NE6NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=72TKMmSqFRHZNaK3PxSAvbtyjQLVTh6p7/GDx78jpKs=;
	b=P1SnC2WPAGToMPf18SMv2XePtM6ctBjBlNgLCgNmZTud5XSCHzk86ZzXR0pNEh+pg2
	cfVVp7j1UbGiZBc0v5zHPLK1RKBybgbZL9H4FTR/4a8r/WgRZfeyKWQn1iDipaApTz6g
	8h5pWvGADD6HREe7nBmmiGKkCr3/UvJZ40or9kKgqGAPenVRT3QmQmRuDJ/lCbJ1xebz
	+2DU0C/DX8JwjDN5O9H/BGePIccD0WMOBdAFS/ovjdA/ybNnOlE0/yROHygB4GyQNZsz
	UYJqpiPFQ/BzEmOvRILKu9mKhN/x054dNwmsrf5hsEqSSQ5kK2dGOUC5AEOLuBf89YkI
	ur3Q==
X-Gm-Message-State: AHYfb5gPahTdeW0pK4iMOaAF0gDUNJf7DxIHj8GQ0g1C7JV/H5VL/y0i
	hVXvv7ZpxHD2TwnH
X-Received: by 10.98.65.86 with SMTP id o83mr17385297pfa.117.1502481630733;
	Fri, 11 Aug 2017 13:00:30 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	t12sm4189881pfg.12.2017.08.11.13.00.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 13:00:29 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<a970dcb0e2778db6af5ecb62bef234d50c20be66.1502474835.git.alistair.francis@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e40aec2-10ed-589d-d380-a296402ae4bd@linaro.org>
Date: Fri, 11 Aug 2017 13:00:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a970dcb0e2778db6af5ecb62bef234d50c20be66.1502474835.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::230
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 2/3] tcg/tcg-op: Expose the
 tcg_gen_ext_i* functions
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKMTH6sYgOks

On 08/11/2017 11:19 AM, Alistair Francis wrote:
> Expose the tcg_gen_ext_i32() and tcg_gen_ext_i64() functions as we are
> going to use them later.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> 
>  tcg/tcg-op.c | 4 ++--
>  tcg/tcg-op.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)

This is a good idea, since I'm certain we have several copies of this in
several of the target translators.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

