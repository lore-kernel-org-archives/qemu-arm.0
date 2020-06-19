Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp411984lfm;
        Fri, 19 Jun 2020 02:39:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA1xFaP4SUdoBo8NIHUvEnmvxFu2THsPWvDKSmvM0ZzmruRhcuSWDNI0Rl9THt2PRKby/Z
X-Received: by 2002:a25:c5cf:: with SMTP id v198mr4582811ybe.6.1592559546623;
        Fri, 19 Jun 2020 02:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592559546; cv=none;
        d=google.com; s=arc-20160816;
        b=o/VqfPhJ+8UY2E8QZw9IBqXvpf/DxdHctL6s3xhlpTTkk8VMyv1SZs1qSg2dm1DMVi
         naxRSKlKw6ActrK1aKFiojiKqVFlwWtY+zdK2VIh9lbl2EqTwxRU1Iv5PdcJRySsAlgp
         gNUCxYMszje8iklgR/agNOqALM/NgwUMuRFnv5OaDohumRVkARg8ezGfJtyz8J6Sj7qz
         II3bCDAhAc/oFvWUD4A1/EqDvjqSIblRfZEZuPcvZ8AHaOSCcXt18/MQyU1uxLsIkJjf
         q1k7RfZNH5SlO+xfMAV489NIxaKIBjNfBYkIAz2XaQrb64OUQ9L2dzUFepCvAOML1cpH
         AGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HJRRPF7fA8zKWHSHcsWKE7IkFeQuIIVPaeeG9N8uago=;
        b=twyMFj2sgSvIT38V77IMxIuCzBYHMnBubsRukI/qp6iT8vtGW3pt6pVuc0lN66pSE+
         1Qnk074vqnOJlPun9d4Am+HNiaxYvgHBEVAPqzI3J/3ludSBOLX+L2v/PEwnOvq4d3+Q
         hsXCOKEXlKD6p6WKc0HY34+eYYwbvWtXmsn/qpxsGaI80EJaStKpPmBp4/faeYathXdf
         a9fGGDib/xfP/4KdI4yYZRfIyxocRt1StBgE9QObufi8EVI7FKYluCuu3WHUQAy44ln6
         lW2wtj5NVT+/MtS8sUvSQxiGKqDHT5aGsXE+Z3SfH3ld1wlBkNg8dFUJVEE4b+alvc5J
         Rgzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KgdzONZy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g79si4592813ybf.497.2020.06.19.02.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 02:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KgdzONZy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmDUI-0008SI-0s
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 05:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jmDUA-0008R3-TQ
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 05:38:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57404
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jmDU8-0006oh-Pk
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 05:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592559535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJRRPF7fA8zKWHSHcsWKE7IkFeQuIIVPaeeG9N8uago=;
 b=KgdzONZyA3HfrjSxb6ZL0X0D39+M0yRYU1rsEr2oJd5bzTlbZMQsUbQjrfn6ZXyHXYYW8I
 l4ZhKlr56moWnsR3b4yNpVhXRQv7R8yE4vrjxRGmSQc+VJeUrLfsd5TVr8vfg2POTOAF2R
 hx2TJDGoN0wNZp2LU0HFFmOlo255z/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-TM1mEqAoP0qR7r77hrgUkQ-1; Fri, 19 Jun 2020 05:38:39 -0400
X-MC-Unique: TM1mEqAoP0qR7r77hrgUkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1806F107ACCD;
 Fri, 19 Jun 2020 09:38:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F1125BAC1;
 Fri, 19 Jun 2020 09:38:27 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
To: Auger Eric <eric.auger@redhat.com>, Stefan Berger
 <stefanb@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
 <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
 <ed1b453d-2568-2134-3e86-c268e82a90f8@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ded58c6b-dcea-67ef-4f3c-b8af9f149ae8@redhat.com>
Date: Fri, 19 Jun 2020 11:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ed1b453d-2568-2134-3e86-c268e82a90f8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:50:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sRgclc9q7oPD

On 06/18/20 09:50, Auger Eric wrote:
> Hi Stefan, Igor,
> 
> On 6/16/20 4:11 PM, Stefan Berger wrote:
>> On 6/16/20 8:33 AM, Igor Mammedov wrote:
>>>
>>> nevertheless looks like faithfull conversion,
>>> btw why you didn't drop Acpi20TPM2 structure definition?
>>>
>> If we get rid of the table we should keep a reference to this document,
>> table 7: "TCG ACPI Specification; Family 1.2 and 2.0; Level 00 Revision
>> 00.37, December 19, 2014"
>>
>> https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGeneralSpecification_1-10_0-37-Published.pdf
>>
>>
>>
> Further looking at this spec, the log_area_minimum_length and
> log_area_start_address only are described in
> - Table 2 (TCG Hardware InterfaceDescription Table Format for TPM 1.2
> Clients)
> - Table 4 (TCG Hardware Interface Description Table Format for TPM 1.2
> Servers)
> but not in Table 7, ie. not for TPM 2.0.
> 
> Are they really needed for TPM2 or what do I miss?

(side comment:

LASA and LAML are optional with TPM-2.0. From the discussion at
<https://bugzilla.tianocore.org/show_bug.cgi?id=978>.

)

Thanks
Laszlo

