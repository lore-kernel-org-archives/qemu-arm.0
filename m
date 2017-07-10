Received: by 10.25.44.15 with SMTP id s15csp3448161lfs;
        Mon, 10 Jul 2017 07:04:45 -0700 (PDT)
X-Received: by 10.176.9.73 with SMTP id c9mr8716438uah.145.1499695485240;
        Mon, 10 Jul 2017 07:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499695485; cv=none;
        d=google.com; s=arc-20160816;
        b=KA4v4MZ3vfT4RviklctEM+BKJZv68oYIjkA3eJuMQnhKgTkRxjPiQLnl4fNTGn+vfD
         p2HxYyzP1YBEDMRiOQOhoEcS1/jP8MEB2/tVrza37gNoaYmVqhaCH4xhyCIPmbk46zyu
         DvTU9aB5jh5F8OzjL7lvkiLNjJj4O23yUZgh44Wg6EkdxBx+WZCG/E7LsbwAthnidiYT
         lIkUb/p29hkTmp7p6KdbCMivSUoS76YSaw5Z1FXMBZaOXmxzm3qnAVpCS+xDLlmN+Z8L
         b6skAjG0H6fytTHR9rZAO1e+qS16CeXe6ZNaaE5/1r9o6Zq9+1bieHrpVRmo3lrf971h
         v7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=gynFEmT6TvniM/h2mSkAFPvQKXMP7U8E1oWEprKyCNo=;
        b=EWiGJWmiGH3aSxp9Aci21IJOdqMJf28QU2StcICYJYHp77HVsN0XbFUWpAFPs1328x
         EUDgjikC2S/C4S6TSfkDoqVpVIQzsI8tiTCEjuzmBj7SZ8mZxMv/jB4jQIHkJbJUOf1T
         I8joKQxkgrD84MJOq0qLK8fTNinA4P+0Ip8W7SQQ4UDX9F6naqSpPXc57ucuXrWB8oQH
         WdWVvvijbQnQ4+gqaI2j76W8CHW4ao5o+9LY05GsT+9FIiOrlGJP9jA/b7f9Jszys637
         HZ2C6EEkYOHZKhw/P+DZcKlrvFBMroVeBocYuDBiYwGdhzKwI3DQRD9kPUWNtkpAg//I
         YlIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x1si5740471uai.222.2017.07.10.07.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 07:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUZIo-00005L-Lv
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 10:04:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dUZId-0008VZ-Mg
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 10:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dUZIZ-0003Qr-Mh
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 10:04:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1dUZIZ-0003QR-H2; Mon, 10 Jul 2017 10:04:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B04487F6A2;
	Mon, 10 Jul 2017 14:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B04487F6A2
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lersek@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B04487F6A2
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-146.phx2.redhat.com
	[10.3.116.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE9E25DC1D;
	Mon, 10 Jul 2017 14:04:17 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, Dongjiu Geng <gengdongjiu@huawei.com>,
	mst@redhat.com, imammedo@redhat.com, famz@redhat.com,
	qemu-devel@nongnu.org, 
	zhaoshenglong@huawei.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhengqiang10@huawei.com, huangshaoyu@huawei.com, wuquanming@huawei.com, 
	zhihui.gao@huawei.com
References: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>
	<df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d48ec6cf-03b6-bf2b-1bed-1e2c34aaf5f0@redhat.com>
Date: Mon, 10 Jul 2017 16:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 10 Jul 2017 14:04:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/3] ACPI: Add new ACPI
 structures and macros
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HQ/DsHYqo3L/

On 07/10/17 15:54, Eric Blake wrote:
> On 07/10/2017 04:25 AM, Dongjiu Geng wrote:
>> (1) Add related APEI/HEST table structures and  macros, these
>>     definition refer to ACPI 6.1 and UEFI 2.6 spec.
> 
> Your mail is missing In-Reply-To: and References: headers, which makes
> it appear as a new top-level thread for each patch.  You'll want to
> figure out why you didn't properly link back to your 0/3 cover letter
> with Message-ID: <1499678736-5244-1-git-send-email-gengdongjiu@huawei.com>
> 

Yes, the git-send-email options to use are:

  --thread --no-chain-reply-to

Best to set them permanently in one's qemu clone,

$ git config --bool sendemail.thread       true
$ git config --bool sendemail.chainreplyto false

This is called "shallow threading" (see git-send-email(1)).

Thanks
Laszlo
