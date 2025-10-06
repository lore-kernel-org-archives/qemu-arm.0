Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F298ECAC5B8
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 13:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5krM-0004hO-AV; Mon, 06 Oct 2025 09:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v5krK-0004hB-20
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 09:02:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v5krC-0001gE-8L
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 09:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759755737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8XP+/L6ShZ+ErNDo2j7T4i24j2ImOHXB2awMNPB8ugI=;
 b=UK7Av57VhUs7SShFTz+iYT4Yj2ks5z922feR1sr5w7a9HQB5Ilu54watiALWjwLwDIGYGd
 mQkP9TkS9dEjgfr7kLARVYHXv43VwVNfT/iTDrbXbxZw538scXVmy+DevKL2xbCOhfXet1
 LaKzwYqpCpzLkN2/xFxJjy/Rz7oKDUU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-jviPu_DEOBC0Uw8n62Bxvg-1; Mon, 06 Oct 2025 09:02:16 -0400
X-MC-Unique: jviPu_DEOBC0Uw8n62Bxvg-1
X-Mimecast-MFC-AGG-ID: jviPu_DEOBC0Uw8n62Bxvg_1759755735
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e4c8fa2b1so21085525e9.0
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 06:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759755735; x=1760360535;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8XP+/L6ShZ+ErNDo2j7T4i24j2ImOHXB2awMNPB8ugI=;
 b=JTbb/bKYvLMN6rr6dNayVvq4HKv3nccmi7g/zqlbF1A4A+xrDU/h5PiLC23vbF3dyI
 maj6/5D8sHqgB4wRsO6ndrDLv6xeqxfIKh5gwlWxJYvEMlcFC0ie1MXk4PX/46U0FtjQ
 Ux70GniEEhz6kc/5SFPNcflhrxXV95xZGkBsHnm3F3wR0QceFKvi4nq1EBSqQcI7psZT
 qP0Bu8uSnQH1lvBXr1zzXcxeKTicg8bWRXYPV/4A8asQLMJzNCcd9RTcYIl9x4PADXuo
 sxbcjmLPESp1KYZoPfwXVYSm/KypdyIM1zxmewO+9XbmpBlAQg22p9qQXDTqEjdk81y8
 auww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP7N7PTaUCLu+dT9Yen1/6kvocQCo87MpCwCMjpKunnu0poR4kpAYeEWGyapE3izQzg467iOgGEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw8HxjzlDFp5tWtRMzAdOMQbT8BoEeuw4iSpuLTF/O7OwT2fPSp
 bFU6rKZ9c5jfjqaITmTMxmGGGTEM91kjuqtxl6ahUn7CjDOiLw4R0MVXfK1nRgS+sZvqOCGgOsd
 YOD1jpATSmY5ts/fH3SGHTE9Er329f/T6LE6kHv6ceFbYDIj8sRu0wA==
X-Gm-Gg: ASbGnctyamcSY7chkMMi0+QJuw/yrtc4OcySd5qusvbr2uV1uJx7QvawouZH9Vt1jys
 vmhwtSbJrrwePtgLaHnWwixmxzC6UaXOFWLjQXp/8ZDOsNdMLUF471W+CwJZQkLkErBvRPMZucO
 ejv/Pl3VDedK4ir5O5LLi7yKUWGo8iRgStwJAq6QqwHOSS/sdPSK3ImsTYZupSwG5fGswxfrJfK
 OqV2XIL3CpD9OPJrwE2YXw56Q6xgH7K6OlLb4mg4eoMLwgi1mvzdqHxALJ5MwPZE8hnk7+0u9K7
 IohJCg+a1VEsypSqImjG2ELvegxfvHTeNvBBJkWk7j5uIZ/TxEI/jBX1KEEHGdbDOBClKIKc0Hd
 eL+WoHVMVJg==
X-Received: by 2002:a05:600c:474d:b0:46e:3901:4a25 with SMTP id
 5b1f17b1804b1-46e7116411emr74067995e9.20.1759755735240; 
 Mon, 06 Oct 2025 06:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5c3nOdBnQ9j37P39o/Q5Li46dr79sX1W7PgBCfxkuek9zYsqmOCp+rbWk9IR7bBwE9cCAYw==
X-Received: by 2002:a05:600c:474d:b0:46e:3901:4a25 with SMTP id
 5b1f17b1804b1-46e7116411emr74067525e9.20.1759755734647; 
 Mon, 06 Oct 2025 06:02:14 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e78c5d290sm117768045e9.0.2025.10.06.06.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 06:02:14 -0700 (PDT)
Message-ID: <3209475c-ea4e-4b73-942c-6354aaa36f52@redhat.com>
Date: Mon, 6 Oct 2025 15:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/25] hw: Remove unnecessary 'system/ram_addr.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin
 <npiggin@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-arm@nongnu.org, Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
References: <20251001082127.65741-1-philmd@linaro.org>
 <20251001082127.65741-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251001082127.65741-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 87ktNlhj_R280l-fZ47r1FbtG7XbJ48dxaaP4fRF8tk_1759755735
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 01/10/2025 10.21, Philippe Mathieu-Daudé wrote:
> None of these files require definition exposed by "system/ram_addr.h",
> remove its inclusion.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ppc/spapr.c                    | 1 -
>   hw/ppc/spapr_caps.c               | 1 -
>   hw/ppc/spapr_pci.c                | 1 -
>   hw/remote/memory.c                | 1 -
>   hw/remote/proxy-memory-listener.c | 1 -
>   hw/s390x/s390-virtio-ccw.c        | 1 -
>   hw/vfio/spapr.c                   | 1 -
>   hw/virtio/virtio-mem.c            | 1 -
>   8 files changed, 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


