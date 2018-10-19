Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3190401wrt;
        Thu, 18 Oct 2018 19:58:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63CJMDN/N7rf58I7IGU8+x2VtaZVkdDIvZ1SHreOQCwpKvRF5i/Vh6jQMogmmU/xTSSNhgn
X-Received: by 2002:a37:2a0a:: with SMTP id q10-v6mr7718812qkh.248.1539917928170;
        Thu, 18 Oct 2018 19:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539917928; cv=none;
        d=google.com; s=arc-20160816;
        b=0DZpbq8/JWm2/74r8jOhbMPDPbJIkC7HDa4fVE0p0nY1vvBu/o18swIvKd/bsk+vGD
         ECpR9hIasmBCy9y/x/dqHQEmfvENIOj2sIeRnN9bK1jGvSX72TrJIFmnAyV8CYDYgZx1
         zNltqdxYfl10JK89WoELiqc+pww2zYnEJCynze6dL/yUll+62oyVM0WayPfIQvaHlOJV
         xaEIkNGWj9AeWiCYABzk2n/KsW+u/2e0mTXwCtAmGCH6FCFj93H/L1P5r5Hyin67LzYW
         1xcpZxXEexueGUaDN3u2JFCuk1nNR+h5GMKFtT+VmGMm8Yd8xkhp5m5Mf2/x7QH8zmf9
         iYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=nNN0nVNwdjZuDig1g+6KRqwrn1JdfLQI8n555ckWgDw=;
        b=zc3Cx059vL+d4+9LoLmzUPmNEwjv06u3E5lBr5YgLC5kTraV0rTxftYUfGUdQud0CE
         nzUgUb9k2daANe8gdOboaq7JIQA2qqeMjizJDQHtzvyFFJxi4+rejMrwZCgwWSfPGfwG
         In0uw1P40I7oIX0Ya1Qnro5hwzLI8OwUHhRwn6gxLqXej2iU/OE7dmKmm15EobO/jpGx
         cKvslc1/MN7HxDrpWhkg/fvCV//9SAwNapbgmgdgp9HvLgluvPsxsXFoCOLJv15wg2jL
         w5rWYk+b0OrgofCY6CQrpbnBeP4nbF879frLY66tvwXx80IOzRczxXivW22whpmC/kYo
         4uqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kc0rZu0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si3946234qky.133.2018.10.18.19.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 19:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kc0rZu0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDKzv-0005FY-Km
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 22:58:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gDKzk-0005FL-Rt
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 22:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gDKzi-0004Oh-FA
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 22:58:36 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42578)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gDKzd-0003wj-Gr
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 22:58:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f26-v6so15801129pfn.9
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 19:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nNN0nVNwdjZuDig1g+6KRqwrn1JdfLQI8n555ckWgDw=;
	b=kc0rZu0fqWIdiV+iOsCPHxuRGawX8+KY65BKqB5qJmPFwXq8460S0zSUFypvOaswrr
	cvnipslGX6zQI1fgBD2PpFfqRP+iH3AnSjLp+uhH4PVBFIq2e322PtsQqTca+ONcif/2
	nrx3qMJkst88urwVPnI0igkmfcD8axOUQMKQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nNN0nVNwdjZuDig1g+6KRqwrn1JdfLQI8n555ckWgDw=;
	b=OtYKvcTJDFIuSvLSMij0QE5juFQfeGI0RyMmNC2E3rSmC+IaOSsGE68ET9IoEGJtUW
	vNSSh7EbfSXPI6c/8iJ/P9k3Kg7m2A58p7DjsgCf9uvYXO6mIzG4q7bDHSnyFBJBmzQj
	oMquO9MxKMhujhkagIn7hv94vAzj/2HJdzmY5Zc761rabPBnOK9fB2fyxNR5iF5x2uyQ
	3dUFfmSlOrOKR+h0wZzuE3AQ72rwqIWyau/nKu9LlLTUHK1W3Hp4g+7O+PLqm8oQQHU0
	dSCDyxiaaR1gLQSyemVCWfth7JVYoQTDHu/58Mg5nnkuXnY8ag/AI8E+yiBDPGmGlZOa
	F4FA==
X-Gm-Message-State: ABuFfoi8sdeZbhnF6/JhX6ZlEeeJBGspgF4bY/oZ0w6S4QHYYH5CYWJ+
	SL7hVBIk4ESvAZ/eJl06dBBTkA==
X-Received: by 2002:a65:5b07:: with SMTP id
	y7-v6mr30997711pgq.125.1539917901773; 
	Thu, 18 Oct 2018 19:58:21 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	y85-v6sm38934750pfa.120.2018.10.18.19.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 19:58:20 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
References: <20181018143042.29588-1-eric.auger@redhat.com>
	<20181018143042.29588-8-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9f8fa71c-555c-72d4-70a7-031f9b69e9bc@linaro.org>
Date: Thu, 18 Oct 2018 19:58:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181018143042.29588-8-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 07/16] hw/arm/virt: Implement
 kvm_type function for 3.2 machine
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P0/qWvFpvvLA

On 10/18/18 7:30 AM, Eric Auger wrote:
> +#define SZ_1G (1024ULL * 1024 * 1024)

<qemu/units.h> already defines GiB.


r~
