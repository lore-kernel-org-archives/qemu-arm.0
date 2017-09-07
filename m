Received: by 10.223.172.38 with SMTP id v35csp545436wrc;
        Thu, 7 Sep 2017 11:09:03 -0700 (PDT)
X-Received: by 10.237.42.15 with SMTP id c15mr328253qtd.310.1504807743137;
        Thu, 07 Sep 2017 11:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504807743; cv=none;
        d=google.com; s=arc-20160816;
        b=0ycrpFVJM7mB3Q23G3/8gYmriFLbcckscDxd33H8E6kcJIJiwQb359woIVYcayq7iH
         9hjfFCvJBGewxjnKCyblbbJZO3yqwSo4hOvlsMVCGJ8s8/O9kt0FvcjtdxZB9WwLgAP1
         TECrT1SjJ4OxBEZ4zAdI78+ynxoL4q5gzocKYKuGVguwuvhCvjC/7WoA1TVRLBeibBpT
         I6q80NaA0gkBNqvf37cVfFCqfPbPT38wIj2MQ67W+gwC4iHODZ8wneg6j5MdAAGpyLvD
         hgtW3U4iY6SYKrtQfjp9w0cGxBxxcaFvRog2eKSPI9lm175PSwahfZkdWuv7On98p9Eo
         cvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zvEqO3vjej6omgDiahRs1SR5huuuzxsA50NDP4fQUpw=;
        b=Vds0LeLO9c6SfpN0aaIMhMr5eAcaCk5t/IfBqr6q0fPsJCBWSPiaY+3NRvClkxO3ph
         CmFKv1MDFwa+mvn2FH1yFQy1AYY0VUJpRMPVODBzAtOgE3Epncl9Ts8PYt8/wyYfgZIG
         m57A0nb5MZ2i/ZvUuzdgIjK29491Bz1uCw7BVSPV/e1VTfHjKK1cl8iH7pw75jARuRS7
         RukH6RgqdUa7CdUNypMeYSWr7zHe7X+Y3kY9XPgE8ALPnP/cRH4LJyOJoNU7GmnHUf+k
         eUCOXNjnjgBF7MZU2bMGDyiWl+GPIbh/tTTSPZXbP4CsEgjs1o0+c7XveZN2fTRkGcFi
         KcnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a8LGGMF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si259650qka.385.2017.09.07.11.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 11:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a8LGGMF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq1Ea-0006su-PS
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 14:09:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dq1ET-0006s4-3C
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 14:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dq1EO-0000uE-Ba
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 14:08:53 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:43029)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dq1EO-0000th-5I
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 14:08:48 -0400
Received: by mail-wm0-x22a.google.com with SMTP id f145so776866wme.0
	for <qemu-arm@nongnu.org>; Thu, 07 Sep 2017 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zvEqO3vjej6omgDiahRs1SR5huuuzxsA50NDP4fQUpw=;
	b=a8LGGMF3fngmxP2UGh81JSfb4YfekP62UZrXhULncxihfWMYcW4aqS/Qybn1ZjPMcv
	FiuxH7KIp/hup8vt5fWPVb0Z9hJAi87lqmHa78GJ4GeukKuX08LrwJfRY70v4ctWzL75
	mkPFD1Zhnlvj0TtJJkGOloQYU4IzQM6IX2KiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zvEqO3vjej6omgDiahRs1SR5huuuzxsA50NDP4fQUpw=;
	b=klDZfs8LS6nB8mf46aCnrIZr8oWDS2wf6F9Z5ilQrmKSU1VnTykzwjNPk4wNcbe6XB
	4GT5vS6wv9TrwVufgHN2tH6oeKAMs9PvAdLP+dMyrzlRxRNSxlGyYVM8R6yuAXLoFYzU
	F3Dwar+UR51RDdD6g9AFQ1Lfw7fvVYl/7nPbXLkVUewqNG4II8Pzjq1M0SHnAsVKeXes
	Kmas4lnSOKqyjXHTqC18aJtU2nOx8hcuYXszhF6QHVyFiWKEFS8zDFF004zSPzp+BJIz
	VZsI+3wbmsd/2bgdu73iBRWq/z1JYZVkza8AcTFslRxtbIHH6j1hST8g69toqaZmthrG
	M/QA==
X-Gm-Message-State: AHPjjUj8y4bOsG6vY53STApsVmR5vq3NKL5ZbRfxc2Pdx5JNyuROmeCi
	gv5y0IMh1V2vtBJ0pFK7NbC2vtuaVyMv
X-Google-Smtp-Source: AOwi7QCl+vugrH83vkZRVYT7Lam6i8OMHCptnYPnqqLxK+50lrA76F9TqcIzm9MFHzYbJXlfP8OJ7sNh7riqql/alOY=
X-Received: by 10.28.30.137 with SMTP id e131mr106383wme.40.1504807727108;
	Thu, 07 Sep 2017 11:08:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Thu, 7 Sep 2017 11:08:26 -0700 (PDT)
In-Reply-To: <57594b14-dbe1-9542-6bdb-eb0b5dc1314a@linaro.org>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
	<CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
	<CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
	<CAFEAcA_0FyFFqJ2GOtUw5CPBKTj1YR9ykroyL-7WCYfbgR0hAg@mail.gmail.com>
	<CAKmqyKOqOJJceCf-wMjZTMQCHDjHWGWT4JAdsqERVXeNtTP6dw@mail.gmail.com>
	<57594b14-dbe1-9542-6bdb-eb0b5dc1314a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 19:08:26 +0100
Message-ID: <CAFEAcA8e9c_kB8b-LEWNGDPoyPfrEHp4_z9cCK70gPzcaV4Wrg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/5] Expose the secure and
 virt properties to the
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w1NF/FNR+J6f

On 7 September 2017 at 19:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 09/07/2017 09:48 AM, Alistair Francis wrote:
>> Hmmm... I'm not sure how to look into this then, as I can see the
>> patches going through to my personal email address, so it's hard to
>> place the blame on the Xilinx mail server.
>>
>> Do you want me to try sending out patches 1 and 3 again?
>
> I had this problem with one of my patch sets earlier this year.
> In the end it seemed easier to post a link to a public git tree.

Being on the direct cc list I get all the patches anyway, so
it's mostly an issue for (1) review by other people not directly
cc'd and (2) the automated tools (I can apply stuff by hand from
direct email but it's a pain as I have to manually save and
then git am every email in the set).

thanks
-- PMM
