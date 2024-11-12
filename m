Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7248860njc;
        Tue, 12 Nov 2024 03:14:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoiYfdwo435kgE2a2+AqG35ufgWJH8ZPTpXIDzFP6Rf5HrJdit9N8rSRjnEWwtZ+TGOFYjqMWlnp4L8w==@linaro.org
X-Google-Smtp-Source: AGHT+IFOiDkNgfKjZ+zMyGvDlpOIsurT8B9HRVltljG0quTguWK1/DYx9pRKRvJSkqONfd1l6xiR
X-Received: by 2002:a05:622a:22a8:b0:461:17e6:27aa with SMTP id d75a77b69052e-4630932a187mr263451471cf.15.1731410049270;
        Tue, 12 Nov 2024 03:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731410049; cv=none;
        d=google.com; s=arc-20240605;
        b=JJ3WGS3UUYGPpGeC/81/uiMSdJz0AaFaMpZPqGSvsHR9TlzzS18x9k5PeKrAokI3Pv
         aW1Sh0Jfx+NsEVgVHpb+ce+077fmGLrr2f8zo/+knqt1zhWPqqXHaqf7cYRiLV2GV9FF
         GlusXX5Tm28JU+WCrQVlnPFSD/Rmq7OFA37ZK8eNJAMVHRJ6KGOg98ByZpbmd9Ya2Oj2
         jKu5DoD+anGwo/6oROBaPdu5LqcwrLpfZjTxYATURQ3BPNjgBJSx5sTPZt6TaEsffvPf
         ED12gpxPBVOvASzl5wNvP4kgFO193mXekML5JDbJTDtlvaO/uFA0Sdtr5CE7M3+H1ZpT
         KhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SzTxMEuDp8444TtWjJA2KU2Ps/WIqufTO2E/1rzCe3I=;
        fh=+54AF8Zc0MCRmrBdDxmEhJCSDzlhVvn0hVQHUIwv5iE=;
        b=ff4GNvqaVmt66jlGgvGQYjZtEppkmtOhcykq+osI/dikmJnsgOPBIck/oDBjZJHwft
         hucSPzYh4q3U56hwbXTNNYnx4reXXIyn++9FklRfAhMdhslDJ97aloJhRYyi5QGbdxAm
         P58y/AzxaM4CaZnugep/fWX6acQSdW+QJNF+FOwaOpIcG2qZZNVjdiCyTgejpi+RIjWs
         nH7Gm6xFT+Gws6gbldPDvlb2pzgo24p4toi/w+C/0k8mPghUVFcxHDAK+oyljjdCYcPf
         5uu32DdawHQLNRAcLmZ/VzqrTK5Li01B7s6zZCYHFNvhmovuS+uH3EYp0vEFwYoyOPRb
         mPIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g4KB+eMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff45c08asi130557761cf.172.2024.11.12.03.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 03:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g4KB+eMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAoqI-0006uu-1s; Tue, 12 Nov 2024 06:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tAoqB-0006uO-OZ
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 06:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tAoq9-0006fF-0G
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 06:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731410023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SzTxMEuDp8444TtWjJA2KU2Ps/WIqufTO2E/1rzCe3I=;
 b=g4KB+eMxrIRZ4uA38SAXUUd+UErvnzvSuC35mAvjUOT8NmDToeN29cTlOGW4/yjej9t43I
 h7SlejrKPFW8Y9XAyRXdaEJpbugd/xYrpUxtRwpsCf+IUwjPCadoLu1gQPMBkMFQ/N/RT3
 ZEatbTXaYEdMUS3Ooa+HuCMCOeZclro=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-Z7gdWnA_M46RbUGIK6RFAw-1; Tue, 12 Nov 2024 06:13:42 -0500
X-MC-Unique: Z7gdWnA_M46RbUGIK6RFAw-1
X-Mimecast-MFC-AGG-ID: Z7gdWnA_M46RbUGIK6RFAw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-37d5ca5bfc8so2950056f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 03:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731410021; x=1732014821;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SzTxMEuDp8444TtWjJA2KU2Ps/WIqufTO2E/1rzCe3I=;
 b=aGOqubAE15Lsf5Gg1WngsJEd31QptvKVNR7obYGjb+rpQNk95Roo4qpU856rsSTSWk
 NBun6pzm8QPooqe13t8D/1Naz2wDYNk2ffLbF7MzYadRdLffgQW4lkqEMZuhC3jxpJ8w
 Mirgxv4UmVcLq7QYhJc3NpVs4HrDTvIx4e5WQCRpv2zUeI3VmIiXyiw6EUAOAbhsu+um
 hxlFK3aglqkaPmDyDLtbzhhklN6fk1UiqVzPMo85Sr9eoVoDdptOyBUCth77pc6VqrAj
 YYD4UKvnVdUGh5yNf54H9euqpcMgRi72klqPUPGU8PcioNKU9e2yiOYBhl/fD5kySidx
 dhjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbpwMZO/iLXvyE98KGJNQ2KsIMHTMSZ/jZCCV0TPcSzxNmXLl4iXT8eO8zF9fpZjOWJ7XsltYZmg==@nongnu.org
X-Gm-Message-State: AOJu0YzB6GNyWkua8Z8ysKrit99gV4HCJoEjAyfWhesEKa4jF2uPkz8b
 eh1lbg+6Thahd/pzvSP51fdWg7V6ets88miZoKrkvc9M1AvzDzjAyFTNS1rlQYyvdadeAKTtGo/
 tDNxDVl0oGb70gXHKPVXmNGxF21IQYrb/bBGMuOSOZ0qS++FMkw==
X-Received: by 2002:a5d:6da8:0:b0:37d:4e74:67f with SMTP id
 ffacd0b85a97d-381f183f6c7mr14598443f8f.37.1731410021351; 
 Tue, 12 Nov 2024 03:13:41 -0800 (PST)
X-Received: by 2002:a5d:6da8:0:b0:37d:4e74:67f with SMTP id
 ffacd0b85a97d-381f183f6c7mr14598426f8f.37.1731410021015; 
 Tue, 12 Nov 2024 03:13:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:8e00:7a46:1b8c:8b13:d3d?
 (p200300cbc7398e007a461b8c8b130d3d.dip0.t-ipconnect.de.
 [2003:cb:c739:8e00:7a46:1b8c:8b13:d3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda03e8asm15134253f8f.90.2024.11.12.03.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 03:13:39 -0800 (PST)
Message-ID: <f5b43126-acbd-4e3f-8ec4-3a5c20957445@redhat.com>
Date: Tue, 12 Nov 2024 12:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] accel/kvm: Report the loss of a large memory page
To: =?UTF-8?Q?=E2=80=9CWilliam_Roche?= <william.roche@oracle.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <e2ac7ad0-aa26-4af2-8bb3-825cba4ffca0@redhat.com>
 <20241107102126.2183152-1-william.roche@oracle.com>
 <20241107102126.2183152-4-william.roche@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241107102126.2183152-4-william.roche@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KW8hxKU6LG0grNhL7c5Orj_kNWhQH_4h6PkHIH6pgU0_1731410021
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2Jb4fj3KGDQ2

On 07.11.24 11:21, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> When an entire large page is impacted by an error (hugetlbfs case),
> report better the size and location of this large memory hole, so
> give a warning message when this page is first hit:
> Memory error: Loosing a large page (size: X) at QEMU addr Y and GUEST addr Z
> 

Hm, I wonder if we really want to special-case hugetlb here.

Why not make the warning independent of the underlying page size?

-- 
Cheers,

David / dhildenb

