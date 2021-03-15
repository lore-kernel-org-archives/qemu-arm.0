Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3408271lfg;
        Mon, 15 Mar 2021 01:57:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB4Smns+WiXzlPKeEYraWTg9GaMp6sl1RflBBpNiD8iHK2GnZrFQoaQQCc/c4Td0Qk1EGK
X-Received: by 2002:a25:dc94:: with SMTP id y142mr34653652ybe.346.1615798679109;
        Mon, 15 Mar 2021 01:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615798679; cv=none;
        d=google.com; s=arc-20160816;
        b=GLRu1mr3qiMq8DWAFjqxsYI3PQzanILxCRxQ7Oan47Wlug/ha9MdBRaZOCeUQL11Gc
         0Ug4AYNmQFZybVgC/m5UByOFRhCOrK9WUYPcJump6UgLfBr/ffFAYmNrcaz3JeShDOmI
         TEu9xzVcmebQYBLWFtycMSruBVIHKQE3qZq8R1eFT2SxSruNmlgJkukk9jxfbPp4T/y9
         oOipdcjmnnw7KxrAlFKn6Qb0Kf9GA26R8v8iG+Vg5hNI/InAUf8hIfWXKPjeWfxS/Lar
         7i6sVz4qbD5/HG+4lih4XbgCreu+2p0ZSrk5r6d5rq/VJhlYB1RGenkKqJb5T5/SOlDf
         HIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=FXyWk/M454tGToxGEoPuTZqKKUwq8ZYtJWhGMG2i3I4=;
        b=xk+LYT+brV/hx+rhFvHF6ZaTb6jpvIwzFGLsxqZJ65/0SBP5y272ufKE4gBbFhiOpw
         LVKOA5b7pZ0uzgda94Ix3rImvQjbRHpwaROi8UK/qpypEKWyK6yU8IE15H46/zJFb3x5
         +PdWQCnaiW1QDwWHLTPwiQta/yP/Z7W5j1V1k6RjbdYJOzyG6nlqF9cUotDsZ2o7o4bX
         Y2s024/8Vgn3hAJqIHM1WvCJM/2ROaoenib1J21EwZyQeg9DmJ4KUft3JpQn58W5g25R
         FdQ9Iy9K///HiXzyshcf3Oii2uwdy05b5vsqmqSPhtzswc4BCTst6eSTleQQO8CGc+GP
         HPBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AYM3SAIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si13496430ybn.355.2021.03.15.01.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 01:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AYM3SAIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLj30-0000DQ-EK
	for alex.bennee@linaro.org; Mon, 15 Mar 2021 04:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj2r-0000CI-02
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 04:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj2m-0006P1-Lo
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 04:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615798663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXyWk/M454tGToxGEoPuTZqKKUwq8ZYtJWhGMG2i3I4=;
 b=AYM3SAIa46WFPrd1GVk9CvpuKehX08PE5MuYjsDzJElYr+CM0/B6/0nms+HxXKYsebZkuD
 ra8wxMdmxgI4HnGmAnullzY95QSkKMmeAluKgWIJO2t9hPgdVUuQE6m14wrzEND6/uZZpT
 uUwLk5tUjEwV1uvgYP8BiIksLM4iGeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-MmNVA530Ot-BxkF0cobF5g-1; Mon, 15 Mar 2021 04:57:39 -0400
X-MC-Unique: MmNVA530Ot-BxkF0cobF5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E618042BE;
 Mon, 15 Mar 2021 08:57:38 +0000 (UTC)
Received: from [10.36.112.200] (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C380610AF;
 Mon, 15 Mar 2021 08:57:32 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] acpi: Set proper maximum size for
 "etc/table-loader" blob
To: qemu-devel@nongnu.org
References: <20210304105554.121674-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <acb73d49-6c26-0f4a-9426-fd345b9cf35a@redhat.com>
Date: Mon, 15 Mar 2021 09:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOp95gA0YpcY

On 04.03.21 11:55, David Hildenbrand wrote:
> Fix and cleanup initializing the maximum size of mutable ACPI blobs.
> 
> v1/v2 -> v3:
> - 'acpi: Set proper maximum size for "etc/table-loader" blob'
> -- Move "etc/table-loader" change to separate patch
> -- Extend description
> -- Fixup maximum size (now really use 64k)
> - Add some patches to cleanup/refactor the code. I avoided using a new
>    enum for the different tables for now, using the table names should be
>    good enough and is simple.
> 

Ping, would be nice to get this into v6.0


-- 
Thanks,

David / dhildenb

