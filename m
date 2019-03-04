Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3973001wrx;
        Mon, 4 Mar 2019 12:00:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+s7QALZ4ks3iFPqR7arCOemjLCxLrXe5O+m+38AezUzIf3P51JWfhz9cN+wWYj+dSDmJ6
X-Received: by 2002:a25:4287:: with SMTP id p129mr16875164yba.106.1551729645749;
        Mon, 04 Mar 2019 12:00:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551729645; cv=none;
        d=google.com; s=arc-20160816;
        b=hg0otojyRnohWs0fZeyAEB5dXdTAd9PHpsL72hRG20/rhZMWk6NGon0sEQGETJEFXX
         xL1zOq5jzvfCKwke4tEbwdHGzLHVM8x1vmhKomdQ6XSCtlVQ0eyId92qdLKAlO7c5m3G
         r34ksbGwmaMH75QnFJMAm49/mOoCb0J1ojysGG2++y5/cat9BDSdTIHTsU7KomqfKvMU
         k+Q/HCQ5y869/Ub8+mdMWIqoFn5exZMJM3sYjg1PQStpfJ6MyQqIxxk8vvH7126zYinl
         QzcASwW1XEA6OfZVrxeQ+yQaSHbOAggBCiNJ7G2Fv2/1jCyM8NfBnU7QjWxMAZ6VMru4
         jqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HDNtP6G259hAUQ2Zp3dom0RdwUORzEynzQxqZeGLHhk=;
        b=JuDj/slBZMuGi7TiSOSXIjA4NyR63WXsDITBhZB7fO5+q68Y3C1HMAMEJz9hbJCmo4
         emsXyndTW+MUjpWptDmmNTJZz0msDfiG1XM6KwAPQH7/A1f8PiNhvs4fjBSSaIQxxYkN
         noTJ1YWJSNpGWN+ZHCA7dOXD+3McqI7+ylCM+mST690FRq1NxYxvj0ieAwfo8kdy4SnG
         flLLBOnYXRf9IevNSqrJAYURTCS1grRFa6EJA9/e4xrPesec+mbLB/o8WtM+k04gMPl0
         mUJshiCbeN+5mMVUtIex+/Si+IhX9GU6u1xwpQNrkDvJwed3OqxlMCJuy1K+jB4WAJT/
         iccA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xreSzo0v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d64si3767725ywh.465.2019.03.04.12.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 12:00:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xreSzo0v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0tlV-0003Fu-4S
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 15:00:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h0sUi-0001Im-A1
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 13:39:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h0sUg-0002FR-I1
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 13:39:20 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h0sUc-0002C4-VG
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 13:39:15 -0500
Received: by mail-ot1-x343.google.com with SMTP id t7so5087208otk.8
	for <qemu-devel@nongnu.org>; Mon, 04 Mar 2019 10:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HDNtP6G259hAUQ2Zp3dom0RdwUORzEynzQxqZeGLHhk=;
	b=xreSzo0vNNlGQocCL0Y+UKFL0EWkoXDLzSDDsB9UgLnkseCYN+gVh1+oP4RkNucCp6
	MRS8ZY1RN9L1JgepR0dUQqhbh7NUA5iLmDq38suYU5nSdkSK4TTI7E5aL8dtkwUxLuy4
	iA8Kk0B+6BcIU9K6oC6hEg4J8Cy6dGGYS+A6rJ3km6F5OZkFcaYiZUV2a3YPJsckNWI1
	aDBDn0p3e7hOmBBsGSggcY3aZ4zNA6aMUX1cgx7hc28s0/cYFbfXkVp4f0ufdyFHXd8C
	+/K8mpB96YaAL3gRyhsd0inzSFXJUp91co3CVbuAavOizkSUb6kJ7HGZCO+QXz5DZSti
	cXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HDNtP6G259hAUQ2Zp3dom0RdwUORzEynzQxqZeGLHhk=;
	b=m/ipBvFeqMsSwu7ua0papDcSCFWeQUKUFcDvqRGgpnzQqUtJhBUTb+ap6IbsVXfvHb
	1MxYEln9VxOyoVGi+YonPcDKVY53bmSl/aDKsbuLtl+rRs+76Ag3fLPHdCucZzX5CuAA
	TsdZ/cjpgOvggzLkPxmnR/mUu2PCx8kzI41ZdwIhelGlyHU3H+v6+0nW2K9BkLxGR4V5
	WUyOMlzf/lZ7cBJJPXiLGJ3RJ6NR5hzSG/mVQLvSiu/3QU85TarM3rEVNoT/KMKWBdeB
	zwyIz3Ey+ZLJjmTLMMszJjQz70KWocF7Ii4QaGyoTKShrsRsqJix1x5Yfpp5zqZqJhoy
	LY+g==
X-Gm-Message-State: APjAAAXSFmxcS/mZfaRPNVDs8LDRRI0BF9lftPucbsi/Z3YaIwWeyuqN
	xRx+XZC41OLjo02umL8iNX7ToHvOmpKxLnoBUXI3jQ==
X-Received: by 2002:a9d:6406:: with SMTP id h6mr13249843otl.238.1551724749653; 
	Mon, 04 Mar 2019 10:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20190304101339.25970-1-eric.auger@redhat.com>
	<a90df8ae-503e-227a-2f4a-3bd61e4da99f@redhat.com>
In-Reply-To: <a90df8ae-503e-227a-2f4a-3bd61e4da99f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2019 18:38:56 +0000
Message-ID: <CAFEAcA8S4OytKYuieOsU+qxqZXhDQcnHrVeqL0G2mdnggR7gRA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v12 00/10] ARM virt: Initial RAM expansion
 and extended memory map
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ZFJpy93pGlf

On Mon, 4 Mar 2019 at 17:12, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/4/19 11:13 AM, Eric Auger wrote:
> > This series aims to bump the 255GB RAM limit in machvirt and paves the
> > way to device memory addition.

> I collected all the R-b's I received from Igor and Richard and I removed
> the PCDIMM/NVDIMM integration. Please let me know if you have some
> remaining comments so that this series hopefully lands in the next release.

Thanks -- I've applied it to target-arm.next.

-- PMM
