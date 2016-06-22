Received: by 10.25.21.96 with SMTP id l93csp2317461lfi;
        Wed, 22 Jun 2016 00:00:35 -0700 (PDT)
X-Received: by 10.55.110.65 with SMTP id j62mr36235101qkc.112.1466578835879;
        Wed, 22 Jun 2016 00:00:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u125si4620316qkf.102.2016.06.22.00.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 00:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFc9L-0001WS-9i
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 03:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFc5n-00066s-JX
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 02:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFc5l-0006x7-L3
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 02:56:54 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:35311)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bFc5l-0006x3-GN; Wed, 22 Jun 2016 02:56:53 -0400
Received: by mail-qk0-x233.google.com with SMTP id c73so52953821qkg.2;
	Tue, 21 Jun 2016 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pcoRXg63a/FsSGtSRZImt8sU3DX2YDYr3h4/yoXpSfk=;
	b=GTRtDJozeN1rpRb59G6Zc3uHd0Gd74jPiUATDH2wknaJICm2eZsNTD0XqlGyMMHBgJ
	mnjPEBdODhTTTEzdPRvOcZAbJf1NBD95p4hzgqnXsSfgq8j66iTGODeMbvuxgRqx0oTw
	K4sW/HO892f85d33K5iniuhpoS1D9mrVvSDVXbR60oKhmmMn6DPEdNYz1KbHfrUuHitA
	NSNIv1Cx1VZjxGZmD/0EMFKtSlh124jYvWG1oH7VX+xNLPFDfwVg1dljQ2QHheIN2sjn
	HZ7elLeU4BWr3k6ARYGVzYfPIRdTo+qWfbGeM7jejm0gxqDaVvcvsvqweEuaGKJ29TiQ
	yCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pcoRXg63a/FsSGtSRZImt8sU3DX2YDYr3h4/yoXpSfk=;
	b=CvSMNEPwWC8B/PReooFyA9MFHS5PcsP0RXSblPEJiRw3il6GUktVofvnLVDmTL4TGY
	X78QYxNd+kx3uA/Q+mFrFEHdxZBTDHJ/BrOK+8i5iHPZLmwtgLs08aPlKICOeQcOnWTN
	oxi30F+yaP84BVJZ4kNAPrJs2yJAI3W4mnnViWoZAcoBsOk57tBOa9Spq7vRyWyAekTa
	74U19K47o0Tz32mZsLxRSaLr9h6S0TE4VVs3DTy/cZI/pDgzH7pJBI5brY+WoVqur19A
	mPvT1TvhMdiJJ0iSP35BXPe4Un/MnOKOo3vTZB1yalVQ3n+oZgeMnY9Q7Oqi2VpPEX0b
	FmXA==
X-Gm-Message-State: ALyK8tJ7lTeNGfF2E+XWO2g7iS5u8miW4l8ooAWdu72maMKuBj5NtStdRrpNemU3H74aQQ==
X-Received: by 10.55.198.196 with SMTP id s65mr33885403qkl.119.1466578612933; 
	Tue, 21 Jun 2016 23:56:52 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	45sm24139508qtr.5.2016.06.21.23.56.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 23:56:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e3b6fbbe-4121-654a-829b-74000113c6f3@twiddle.net>
Date: Tue, 21 Jun 2016 23:56:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466528974-12183-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-devel] [PATCH v2 3/6] translate-all.c: Compute L1 page
 table properties at runtime
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uyMoc8lBO+EU

On 06/21/2016 10:09 AM, Peter Maydell wrote:
> @@ -825,8 +846,8 @@ static void page_flush_tb(void)
>  {
>      int i;
>
> -    for (i = 0; i < V_L1_SIZE; i++) {
> -        page_flush_tb_1(V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
> +    for (i = 0; i < v_l1_size; i++) {
> +        page_flush_tb_1(v_l2_levels, l1_map + i);
>      }
>  }
>
> @@ -1850,9 +1871,9 @@ int walk_memory_regions(void *priv, walk_memory_regions_fn fn)
>      data.start = -1u;
>      data.prot = 0;
>
> -    for (i = 0; i < V_L1_SIZE; i++) {
> -        int rc = walk_memory_regions_1(&data, (target_ulong)i << (V_L1_SHIFT + TARGET_PAGE_BITS),
> -                                       V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
> +    for (i = 0; i < v_l1_size; i++) {
> +        target_ulong base = i << (v_l1_shift + TARGET_PAGE_BITS);
> +        int rc = walk_memory_regions_1(&data, base, v_l2_levels, l1_map + i);

It would probably be good to cache v_l1_size in a local, so that we don't keep 
re-reading it around the loop when we know it doesn't change.

Otherwise,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
