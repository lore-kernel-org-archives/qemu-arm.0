Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1387410lfm;
        Thu, 18 Jun 2020 00:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQWMf8ZJ3bnqgGWbVUaUzdF5cP9umwtyOb5snB4oPQaaBIctqVpYJ8SRhH1o5oBDAa+Dn4
X-Received: by 2002:a5b:942:: with SMTP id x2mr4564203ybq.273.1592466638695;
        Thu, 18 Jun 2020 00:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592466638; cv=none;
        d=google.com; s=arc-20160816;
        b=tyHRgh4cInrceI2RTzcca4iL5lFg7nbQRGG7Jfmj1eyDJkJyEgSu4YLYILbbQfEhKU
         aG1iWHratLg9kN3jTevsY6+z4OZ1MEmXdXvOtWye25nXa6ZVI3mFMA37lcQ+297SddH0
         mUQlhpfliRV0d6IUqRW985A8XKWesNQf7jqueSFHz/RcnjPgLAMosjgIcVILKRVOKvK4
         tMmhg1pmic/dZBh9YAsOFjMIOlVILgwYoHkUw28is4zToa2ZoW0a8rf4tdxzqUr1bgh7
         LxhyLL5VgKg5vbU454oBr5agX3azy7xf5Os3P950HSN504DAWgN7REPr5iU863Z8ZJ2E
         5Qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gYBWXsDbJwxOwgyoi8/Sh8EeM+qen6oIVXOvPq+OvhU=;
        b=swzgxWde34h5nhVsa+dIqryaWiOQ2osKoeViYoH0mJ+fE5+1QRmDEyPR5ZmNZHogKz
         kQRB5/ScJT2YZ1emY2ULkMVl0URiRb2yKSJdwez7NGSC+PCk3YqQH7Royw43Q7TOfUPC
         y7wczigXNi0DrIr1aIZDnTatOHDZ2e7XO1cncFJbE8TmcLNb+hBR9vTYZYgzrK9zIG/K
         lBy0K+6WZNhxgyFfHtuS+fgq6gg+QkWqLKa+d5Hy9xHeFrz8KPOc2RcZwR3DbhrDpDka
         fkGLEJ1COhNFsIQ8qZdLFLDXtkiAvx+rRzbXiWUaY4PE9E03br9BQnZCL3knB82AGSbW
         AfXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b2H2ROzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h67si2041359yba.348.2020.06.18.00.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 00:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b2H2ROzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlpJl-0006TF-W1
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 03:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlpJc-0006Qk-Bt
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 03:50:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlpJZ-0002Zp-L2
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 03:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592466623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYBWXsDbJwxOwgyoi8/Sh8EeM+qen6oIVXOvPq+OvhU=;
 b=b2H2ROzzqeznehexzn7aKNxI8ylLFZietmVcuYrrGajXuCmwDQ3iqf8gJG0gLL2D50Lnw4
 gdmTxNNofBY+U/spXK+Mi68GMx/IJUj2BxAboIK2B6d4sqCwSUzn1u/L7cuGvtIcSDo01H
 hsqvM760H03TqV+XN2OSciy2NA1KZH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-wqdm4NZ9P6CClNGekz_c7w-1; Thu, 18 Jun 2020 03:50:16 -0400
X-MC-Unique: wqdm4NZ9P6CClNGekz_c7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6268E107ACF3;
 Thu, 18 Jun 2020 07:50:15 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DBEF7931B;
 Thu, 18 Jun 2020 07:50:05 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
To: Stefan Berger <stefanb@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
 <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ed1b453d-2568-2134-3e86-c268e82a90f8@redhat.com>
Date: Thu, 18 Jun 2020 09:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 philmd@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, lersek@redhat.com,
 ardb@kernel.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LS2f+1qsIxcS

Hi Stefan, Igor,

On 6/16/20 4:11 PM, Stefan Berger wrote:
> On 6/16/20 8:33 AM, Igor Mammedov wrote:
>>
>> nevertheless looks like faithfull conversion,
>> btw why you didn't drop Acpi20TPM2 structure definition?
>>
> If we get rid of the table we should keep a reference to this document,
> table 7: "TCG ACPI Specification; Family 1.2 and 2.0; Level 00 Revision
> 00.37, December 19, 2014"
> 
> https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGeneralSpecification_1-10_0-37-Published.pdf
> 
> 
> 
Further looking at this spec, the log_area_minimum_length and
log_area_start_address only are described in
- Table 2 (TCG Hardware InterfaceDescription Table Format for TPM 1.2
Clients)
- Table 4 (TCG Hardware Interface Description Table Format for TPM 1.2
Servers)
but not in Table 7, ie. not for TPM 2.0.

Are they really needed for TPM2 or what do I miss?

Thanks

Eric


