Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99EED13C30
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 15:20:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkONW-0003lL-7e; Mon, 26 Jan 2026 10:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkONV-0003kq-4B
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 10:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkONT-0005cZ-B1
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 10:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769440782;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qH4xRMGaEDJjPWwAVeyd+Ysk+yKlLFbC7vgctu7Mf0=;
 b=hHsf5pZ8lB84Z6WiKtKwm+O8w5FtbQR/rwHitLXNG7eGBJ1LPsDGe+VBY3k3SRnzC+AKtg
 du4Tjj7V9vKfIgxZgUYETBK7AmCXU8zObwSyAskohHg3c6UFzYGTmen5LNgBDasYoCQuOO
 EHT5SwnSgR8MVjmeq1l0vKHEiFVOK08=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-MgEaD5ZYOpufwGqzHHKLpA-1; Mon, 26 Jan 2026 10:19:40 -0500
X-MC-Unique: MgEaD5ZYOpufwGqzHHKLpA-1
X-Mimecast-MFC-AGG-ID: MgEaD5ZYOpufwGqzHHKLpA_1769440779
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-432db1a9589so3570672f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 07:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769440779; x=1770045579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qH4xRMGaEDJjPWwAVeyd+Ysk+yKlLFbC7vgctu7Mf0=;
 b=aX1SCgydwgW9R9Y59O/4/2pi0mc1t2L6/8nSFnxjtDOkoSiBG4BjWpJEzWDaoNfBKk
 xgb9nkE6dgjZ77QvljkuFVNFAbGq0wxaz9Ib6g7SikSAYSvKbAQCZGlEYfx7ypKzR/k2
 sEm1YHuC4tI/lGPki//rzAzhBc+V7vX6sJEoWM2xsQxzrbRZ/AA+ZJIZKEH4CH330Fbp
 ehJP66OGD4jmnnJ9P+4VI01BgdZC/xYdJbRQcn6r1Hgqd6TULt1OqLs7ZGp+FHC5PU2V
 zW7PVC86I1PVb1FL1WZTmmFoPCM9925vjsvM1iBf9QxVoVo0ApnngouCnKI7ediHzhZy
 324A==
X-Gm-Message-State: AOJu0YxdVJAfQiSI7mi4pESLUrxWrI4HwZXAYu+0k9dpKf5+CpyJiA74
 QFIj6oZ+6vodfgmVYZaZJ/ZzA511/UjFQXNkXL2YZX2TbrPXLdU9C3eEKzYXb4TgfRiA2AU+FKM
 ZwrHxQfzdEFtQJUUduKHX121T/5bjIofgX6/+cowsGDcBECRBY++bYg==
X-Gm-Gg: AZuq6aLtjn+vMqE0Uc3tY6Hxmxpm54o+BmUQEz13Jj6Vs4E8M5g8TGhv7XTLWxw6iH0
 j2khwFTt4ERglSyDVKgIOFguS0AhKkU72gn62H0zsdTMK1CiVEr5znbcbdT/scqz9SQBErpzL3w
 l3DnDU6aPBsUEXXCahe36QboY4R2GCfz0BSYseO75NS0uH/xYAXoU0Sb9Yap/eVuBf/m4rWgvys
 MSBFnQ5bdr0IzEhqj3szHRZDivIb7V02Cc8HkPVhOiJMVWrmW1z9wnM08KX9GFyubkuLFm3nzt9
 Rd7K5jV+DxMFQnHSoXPlvNsNFNroI0HjAYhJ3eMR51QGdtrki753LF3LmgPgj50Z1rQC0CSxL+u
 qxWcYuqryxtgtEI6lCkC4nby2q+fbbgF7oLGEiv50PRpL5JXIGD70Z2iCLA==
X-Received: by 2002:a05:6000:24c1:b0:42f:b9f6:f118 with SMTP id
 ffacd0b85a97d-435ca145820mr9229137f8f.15.1769440779015; 
 Mon, 26 Jan 2026 07:19:39 -0800 (PST)
X-Received: by 2002:a05:6000:24c1:b0:42f:b9f6:f118 with SMTP id
 ffacd0b85a97d-435ca145820mr9229071f8f.15.1769440778452; 
 Mon, 26 Jan 2026 07:19:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f7474csm31731079f8f.37.2026.01.26.07.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 07:19:37 -0800 (PST)
Message-ID: <e3120a16-efd4-4648-86c0-61564218d046@redhat.com>
Date: Mon, 26 Jan 2026 16:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/16] hw/arm/tegra241-cmdqv: Read and propagate
 Tegra241 CMDQV errors
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 nathanc@nvidia.com, mochs@nvidia.com, jgg@nvidia.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-12-skolothumtho@nvidia.com>
 <aVLb/zDSDda6eSmR@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aVLb/zDSDda6eSmR@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YghqWsyDwIFL-jYpVRobqtGWstwilgOyon3__M9YgGc_1769440779
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/29/25 8:52 PM, Nicolin Chen wrote:
> On Wed, Dec 10, 2025 at 01:37:32PM +0000, Shameer Kolothum wrote:
>> +static void tegra241_cmdqv_event_read(void *opaque)
>> +{
>> +    Tegra241CMDQV *cmdqv = opaque;
>> +    struct {
>> +        struct iommufd_vevent_header hdr;
>> +        struct iommu_vevent_tegra241_cmdqv vevent;
>> +    } buf;
>> +    ssize_t readsz = sizeof(buf);
>> +    uint32_t last_seq = cmdqv->last_event_seq;
>> +    ssize_t bytes;
>> +
>> +    bytes = read(cmdqv->veventq->veventq_fd, &buf, readsz);
>> +    if (bytes <= 0) {
>> +        if (errno == EAGAIN || errno == EINTR) {
>> +            return;
>> +        }
>> +        error_report("Tegra241 CMDQV: vEVENTQ: read failed (%s)",
>> +                     strerror(errno));
>> +        return;
>> +    }
>> +
>> +    if (bytes < readsz) {
>> +        error_report("Tegra241 CMDQV: vEVENTQ: incomplete read (%zd/%zd bytes)",
>> +                     bytes, readsz);
>> +        return;
>> +    }
>> +
>> +    if (buf.hdr.flags & IOMMU_VEVENTQ_FLAG_LOST_EVENTS) {
>> +        error_report("Tegra241 CMDQV: vEVENTQ has lost events");
>> +        return;
>> +    }
>> +
>> +    /* Check sequence in hdr for lost events if any */
>> +    if (cmdqv->event_start) {
>> +        uint32_t expected = (last_seq == INT_MAX) ? 0 : last_seq + 1;
>> +
>> +        if (buf.hdr.sequence != expected) {
>> +            uint32_t delta;
>> +
>> +            if (buf.hdr.sequence >= last_seq) {
>> +                delta = buf.hdr.sequence - last_seq;
>> +            } else {
>> +                /* Handle wraparound from INT_MAX */
>> +                delta = (INT_MAX - last_seq) + buf.hdr.sequence + 1;
>> +            }
>> +            error_report("Tegra241 CMDQV: vEVENTQ: detected lost %u event(s)",
>> +                         delta - 1);
>> +        }
>> +    }
> This part looks quite similar to SMMUv3's vEVENTQ function. Maybe
> add a vEVENTQ helper in the iommufd backend?

+1

Eric
>
> Nicolin
>


