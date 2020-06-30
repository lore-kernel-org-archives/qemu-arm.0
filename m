Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4114032lfm;
        Tue, 30 Jun 2020 09:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkUjwajI5W4pl5CyHIlGrUjmNZ/Ez7aTtcp76a9sewPI8kuZzbrYvJLBEwNqLtnl9SZggN
X-Received: by 2002:a25:3610:: with SMTP id d16mr37942000yba.213.1593534598872;
        Tue, 30 Jun 2020 09:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593534598; cv=none;
        d=google.com; s=arc-20160816;
        b=m9ZjQi0kJUnFYoTfrCg7Ugay7IDmmqBCLHBKE0if4pBCMfFFN1xAt76m4SdQcKQ6I8
         UYKr6ls1fPxwEeRcMHBayYBxFa8KNB9I+GN9/tKhIJcakIL45qxE0bDvDlrBKLINigtV
         e0ndNaGXW1FAzbjF/otHghJnBoyHt0IEE/VUXh5oHsAhVu+Ue55DQ6vlZGnocXK/Xk+B
         h/wAEfs6AMxsmjy6MebS/WuSOh8gM11lAoqD/Vvrk2REEPmgXk1vrsLQFjHh9pkzyG7O
         +iOQqf60KC2YQlTzL1bVzEZAvarHBVaDgDCzAPDmY2sKRvb1HJpzVhvOSBWnNYet68JL
         mrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Iki+3wFuolN8flHlcoZTKxF/AtY4NLWFToDzLtfW0sU=;
        b=Vp7norq+QxbAn2ZvBx3QOtx6HNxZ/I2/O47QEveV0gd1IprcYupUS/Q/qhP9Uu8cLb
         RlJgFicGyC3RpWc45mDAYzUGvQZHCEOWraYqCi5uPrQ+OPfeUbP5TQuOA/Xs4loL67Gf
         J3nrqLc0eQrxT4hiXKUu9Fn5IznDH3jbkIesu/qEbLMJ57rym7dq6t1HhTiRB+xF2ANF
         23p3vQMbTsZunPK8MMq55rA1ofV7oZOr9VpETOUShvLnmFBFOZPs6Ba6/XE2ASpGr+6H
         SvnNEtDbZ2Klcqfh9BFrL3ThcHdwcVivrCsOXmgIj4qffnhQhZrfUvExLspbjanvZOK+
         87ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZKaV2OW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 196si2959296ybd.439.2020.06.30.09.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 09:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZKaV2OW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqJ8w-0003Gk-9R
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 12:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jqJ8O-0002g8-5U
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 12:29:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55589
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jqJ8M-00052B-N1
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 12:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593534561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iki+3wFuolN8flHlcoZTKxF/AtY4NLWFToDzLtfW0sU=;
 b=ZKaV2OW5DASUXHC+kaUOQMY6+MP/QLUsNYvcl3+udX4hupeweQkfITSqYEpNB1rbq9yTFh
 +JRE6QJzY7YjcGoJ/VZWRE1XXh38ofPQDa6o0SNFv+woQbqfVBrjU9CEDxsnaCmP8cdqiO
 0Qgt+Mez3gNNbJwviZ9TepELieoLJ1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-DJ-BRuTZM1O7V9aFBB8cEA-1; Tue, 30 Jun 2020 12:29:15 -0400
X-MC-Unique: DJ-BRuTZM1O7V9aFBB8cEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ED8F1005513;
 Tue, 30 Jun 2020 16:29:13 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD4C5D9DC;
 Tue, 30 Jun 2020 16:29:04 +0000 (UTC)
Subject: Re: [PATCH RESEND 6/9] hw/arm/smmu-common: Manage IOTLB block entries
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-7-eric.auger@redhat.com>
 <CAFEAcA9FZV=jSk_9aJ_tHy=KLy+YrTFNoiqvCv7BMs0dWrHWFA@mail.gmail.com>
 <db6d92ba-2716-40df-54d3-84fb51ab3ad3@redhat.com>
 <CAFEAcA8ez0ycijFSZrVA3haaoKGho2Q2gQR=cDiiAm7S=-t6OQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0936903d-109f-c9cf-b40e-767fe7a21dae@redhat.com>
Date: Tue, 30 Jun 2020 18:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ez0ycijFSZrVA3haaoKGho2Q2gQR=cDiiAm7S=-t6OQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:34:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Will Deacon <will@kernel.org>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMJEXBGq5uuX

Hi Peter,

On 6/30/20 5:50 PM, Peter Maydell wrote:
> On Fri, 26 Jun 2020 at 14:53, Auger Eric <eric.auger@redhat.com> wrote:
>> On 6/25/20 5:30 PM, Peter Maydell wrote:
>>> Rather than looping around doing multiple hash table lookups like
>>> this, why not just avoid including the tg and level in the
>>> key equality test?
>>>
>>> If I understand the range-based-invalidation feature correctly,
>>> the only time we care about the TG/LVL is if we're processing
>>> an invalidate-range command that specifies them. But in that
>>> case there should never be multiple entries in the bs->iotlb
>>> with the same iova, so we can just check whether the entry
>>> matches the requested TG/LVL once we've pulled it out of the
>>> hash table. (Or we could architecturally validly just blow
>>> it away regardless of requested TG/LVL -- they are only hints,
>>> not required-to-match.)
>>
>> This change could have been done independently on the RIL feature. As we
>> now put block entries in the IOTLB , when we look for an iova
>> translation, the IOVA can be mapped using different block sizes or using
>> page entries. So we start looking at blocks of the bigger size (entry
>> level) downto the page, for instance 4TB/512MB/64KB. We cannot know
>> which block and size the address belongs to.
> 
> Yes, but we wouldn't need to care which TG and LVL the
> address belongs to if we didn't put them into
> the key, would we? I'm probably missing something here, but
> just because the hardware might want to use the hints in
> the invalidation-command about TG and LVL doesn't inherently
> mean QEMU is most efficient if it cares about the hints.

OK I think I understand your point now. It is not necessary to put
TG/LVL in the key as log as they are in the entry. I will look at this
implementation ...

Thanks

Eric
> 
> thanks
> -- PMM
> 

