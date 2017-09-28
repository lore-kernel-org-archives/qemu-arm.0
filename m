Received: by 10.223.197.9 with SMTP id q9csp6952wrf;
        Thu, 28 Sep 2017 15:39:41 -0700 (PDT)
X-Received: by 10.200.41.105 with SMTP id z38mr3409226qtz.106.1506638381822;
        Thu, 28 Sep 2017 15:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506638381; cv=none;
        d=google.com; s=arc-20160816;
        b=pxRPxyPutTBiw21RiChAR5oalrqimBXcYkNNQSDsuIFaLFC4vcqLYX945/YIRrCI5y
         +DdDziuABWx8WrfER9MUveSJ8tbQo+blhx7P905RxA7mpzv2YzjEtEpJfAazHH4IaP93
         Jf4diN3N0Ih+APc2LIqKh9Z/aWWlVvXWGGImMAi+0EDtjh/RsK9OQsMuuMaSJScZm/5N
         N6sGqxKX7fsllK6ZpCq5BOIBPLNByO967X/v+1z9/THGOlq0GvQkYbauuqbm9KtC0J3k
         /lY/vNhkgyojMzM1bkHJQTS2PkkYTjnclOzW+jmAtwOb4q8sn/ASdk6Chjs8/kOkVraS
         eMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qHJMnMejRW95H6eBk2uL9avn741XyZn9iRscKM10lD4=;
        b=ktgp02uX4kT5iW/C7frS2XSrY7DXW6Z0uAlO+Rb+iKf/yTEVa3DF+uakChum6AAnfw
         Nt82WjfJTo1nXguIvda1DEQ0MIi0aqgGKr2rUUSRYJ+cdR6lkJApfL5OnRzqrBleQW1q
         52EecDrg2JDTnBOLqDHo0JpZZwJwVzo4WGR9D8GWdhtPhfn48XHDiwZ/bc7Hiu1MDtXR
         6O9dX6PYOWrbm/PJPCVriSJ50BLrvnMCcnCAdZGsjHYU9q6jnsT4iW9MZ6LVeKnLSq7U
         1SExNw++9R7tZm638njltK6qUtr7gxTt18xeeY1gk/D4gP2Tn51wQz5nF2t8xRtwTvsm
         DhBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iTjLTIj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si1680228qts.67.2017.09.28.15.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 15:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iTjLTIj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dxhT1-00055B-IB
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 18:39:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxhRy-0004VD-Tr
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 18:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxhRy-0005YT-4D
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 18:38:34 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:38847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dxhRs-0005Mg-AA; Thu, 28 Sep 2017 18:38:28 -0400
Received: by mail-wr0-x243.google.com with SMTP id 45so757736wry.5;
	Thu, 28 Sep 2017 15:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qHJMnMejRW95H6eBk2uL9avn741XyZn9iRscKM10lD4=;
	b=iTjLTIj+Y/x/o0Im/rJ3GGms2JU8rL0VSZMHTyF3VaoqwAlLqG2+Fk15lfwuVIwTI7
	hAtnnAzX2bRDWwUxCXwJo+l8a984WYQi858d41VEZPHp0ieU3fheJk+jJvuJqy7sbdTI
	6PnshLyj/ubG4z3ecuKtkq5h4sPyDJ/rAESZqjJuEkplPcGMMd/CdDucomTAfS5QNvMf
	UeMY51fmn04Ujisl8yAAHgFOuFgvLZJFSQA63EnQ/D6CRvTuh3ZfSLEKPZZYwBwL8E3X
	i0sWEpUqvIRyWvXN5Ch48o/ROaV+u8r5NfdIuNy1VPS+zTZ/4PHH8YVf0s5rFCN3O2av
	mWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qHJMnMejRW95H6eBk2uL9avn741XyZn9iRscKM10lD4=;
	b=GS0jO023JjA6z0gfNUG8SX5ZZES2Dwf9qABi1jIGgud2RmB9lgwjabPgxmQ2oHjSuh
	bgzV9lLe2UvG0GP0RFkKlAePGxdqATYCAIgn/RpLYNK8VYQLEGVxXoRSGMFlTXz04+sa
	IHsBr2i+JkCiApKba09cfP+YN6wUgW823tQw7zn24ndCbUmV2EAeUM56vogCyqzd0Qfo
	0aJNZ0HjfUknscDKw9scMtl/Z1ENnponX89U6tWEDfF7+Y9NQB4tCo//f51jBOJ29av3
	oTFR5NNfL4Brihp0E2Ju3Pwdi0lVsInwSZLEoE1p1WG54717nQt7uhCJ6/37cyOYPHlH
	mkww==
X-Gm-Message-State: AHPjjUjCjIr0R4EW0OqZabOsgUJX43931EaLZ2cx9pxeZM1i2IMzQGIc
	0jWgxUdILyiQ9Mnm2TlmAqBFPez7CUoCW2+xqts=
X-Google-Smtp-Source: AOwi7QDY33Zlf5rkBtKEKHTkCqsNM9kbPHJTD1/76wo1HKOxTjBcS/4v0+PkvWVuLZ4ZV0Ss/KvTQFsTkvtxMcIjo8A=
X-Received: by 10.223.136.119 with SMTP id e52mr5118779wre.225.1506638305905; 
	Thu, 28 Sep 2017 15:38:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Thu, 28 Sep 2017 15:37:55 -0700 (PDT)
In-Reply-To: <CAFEAcA_G8Md3k6EAqoN1=GCcXoCq_8vAUZ_qjOZp5GbnnfmcrA@mail.gmail.com>
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>
	<1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
	<CAFEAcA_G8Md3k6EAqoN1=GCcXoCq_8vAUZ_qjOZp5GbnnfmcrA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Sep 2017 15:37:55 -0700
Message-ID: <CAKmqyKM9e2R2f3BorZJ9R1XMaAwNRxvCEPGrSm3Jh=O=PnJ-_A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/8] Replace all occurances
 of __FUNCTION__ with __func__
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Eric Blake <eblake@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: ptNLUUOkscy/

On Wed, Sep 27, 2017 at 4:47 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 September 2017 at 06:32, Eric Blake <eblake@redhat.com> wrote:
>> On 09/25/2017 07:08 PM, Alistair Francis wrote:
>>> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
>>> index 58005b6619..32687afced 100644
>>> --- a/hw/arm/nseries.c
>>> +++ b/hw/arm/nseries.c
>>> @@ -463,7 +463,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
>>>      uint8_t ret;
>>>
>>>      if (len > 9) {
>>> -        hw_error("%s: FIXME: bad SPI word width %i\n", __FUNCTION__, len);
>>> +        hw_error("%s: FIXME: bad SPI word width %i\n", __func__, len);
>>
>> Not this patch's problem, but it would probably be simpler if hw_error()
>> were a macro that automatically prefixed __func__, rather than making
>> every caller have to supply it themselves.
>
> I'm not sure there's a great deal of benefit to that change, because
> use of hw_error() in new code is rarely correct (it does an abort()
> so it should never be used for guest-triggered conditions, which is
> about the only time that you might be interested in a guest register
> dump rather than just asserting). Most of its existing uses are in
> crufty old device models.

Ok, another excuse to leave it out :)

Thanks,
Alistair

>
> thanks
> -- PMM
