Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8080256lff;
        Mon, 23 Dec 2019 23:40:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhWtzlRTsQc05rTnGtPCrjONmBt8gRzfkyDZ7/2QWe3svzx0aHFtYdUVtlETLMocmM8o3O
X-Received: by 2002:ae9:e407:: with SMTP id q7mr27781577qkc.23.1577173221580;
        Mon, 23 Dec 2019 23:40:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577173221; cv=none;
        d=google.com; s=arc-20160816;
        b=EtT/SzEPffNdoxZFqATbNsbZh6bhp3tITdOryJjRZnrQsDPeALTWwFrgmMT8iFGJYI
         fV4thmoQo3mZ0/36dfwy90qCVUA6qHNtj6Chr1idwp71G5Kh918Q8M+ZOGG7uiagPUjw
         s4KvIemmmTNVxfT1aFVDCybs/hxraDrLvqZuGClL7A3dlNwntRVGLD6819WI0/UG3Wad
         hC+TCrtpMXeRrc07uVxazeVrNXOUdmTOTZ8yYQp/++6tlH6L1ZZknf3IO91XLCdKZpi9
         xuCw/i9JB4543pobwWT0vK0qi83XAPBbppFkCRJGSYQaWf2ZnneQECPwIeaRPptnFJ6y
         EKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j4NknF9ba4R5CHHAR6Mw5Q57fD8rHs5SRd5mZFYdoNU=;
        b=w/VptkjIylgo9JEHA5b3xyMJ9XCxwAM/TFndwJf20iZuoJnaIc5aeyS0CdAp/49SSv
         GS58O9OaL7JM8VFAyM6Ovwm7L+4CMtNsd1tbcj0R+7qgGybsuVVIM2xQNUid2Zq4d/BB
         eJ2ZhBPa4ocPbQrhEWZkG1EOiC47o5cdF/HVLTkttDzkz1d8w9YeQDtqachGYAqeRqIZ
         52HNOTOGV45oMtGbsrmLtNUWHPXYPErqfhcWCxhn5xDrhIZc28wL4l/OWYPdfuSNv+MY
         uRbZNbzq4796qfDN0wzbSmm95Ca/Po+P1LOcLRSW8UBrG5DW8VS/6ig6IN+7HBpmBqed
         52ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HYMZCPBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si9377201qtp.30.2019.12.23.23.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 23:40:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HYMZCPBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ijenk-0000LG-LF
	for alex.bennee@linaro.org; Tue, 24 Dec 2019 02:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ijenW-0000JS-EB
 for qemu-arm@nongnu.org; Tue, 24 Dec 2019 02:40:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ijenV-0002pC-1i
 for qemu-arm@nongnu.org; Tue, 24 Dec 2019 02:40:06 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59167
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ijenU-0002op-Tf
 for qemu-arm@nongnu.org; Tue, 24 Dec 2019 02:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577173204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4NknF9ba4R5CHHAR6Mw5Q57fD8rHs5SRd5mZFYdoNU=;
 b=HYMZCPBTVC2dSohoT1835E/nmiiq7uYKCCQZj7GlnRpS4CLwYxykbuqBLxV0uKBYvs4OWi
 92rTW12i1IkPMlUCSC1cnmb6a7lsqO34FmiC2IMN0ptwdkxCyQUytU2ZpKdPPXe18mMaNm
 vTfoWV95sqenKzxwJajbjWIp77ThywM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-ayroffloNl-pgEI11xxYSw-1; Tue, 24 Dec 2019 02:40:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 934F7DB20;
 Tue, 24 Dec 2019 07:39:59 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2732160BE2;
 Tue, 24 Dec 2019 07:39:43 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 19/20] pc: Add support for virtio-iommu-pci
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-20-eric.auger@redhat.com>
 <20191210165032.GQ277340@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <336ecbf4-bcda-36a3-201f-d052da885ae2@redhat.com>
Date: Tue, 24 Dec 2019 08:39:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191210165032.GQ277340@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ayroffloNl-pgEI11xxYSw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: gF8Qc8tgNYkh

Hi Jean,

On 12/10/19 5:50 PM, Jean-Philippe Brucker wrote:
> On Fri, Nov 22, 2019 at 07:29:42PM +0100, Eric Auger wrote:
>> The virtio-iommu-pci is instantiated through the -device QEMU
>> option. However if instantiated it also requires an IORT ACPI table
>> to describe the ID mappings between the root complex and the iommu.
>>
>> This patch adds the generation of the IORT table if the
>> virtio-iommu-pci device is instantiated.
>>
>> We also declare the [0xfee00000 - 0xfeefffff] MSI reserved region
>> so that it gets bypassed by the IOMMU.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> It would be nice to factor the IORT code with arm, but this looks OK.
I factorized the iort table code generation. Not sure this will be used
eventually but well.

Thanks

Eric
> 
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 

