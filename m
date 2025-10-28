Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83164CCF9EB
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:43:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoe7-0005Xb-2e; Tue, 28 Oct 2025 14:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodj-0005F9-HI
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodP-0005o3-DG
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761676884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FRuQL0V5jEYZXhTBhriqZ7fEok/jJhmd8zExR7Hsjo=;
 b=MBfZsGGF3DwQ8lWIkPbo9VD4YzUiCEEtfKPA22Q1Sohb6zgKdk6FSUcs9bkw2GvBxtZngu
 w/fTdxy9doCGuP99vS97hlfY/XVXJ2xlGPSwgeI1ZjXcMAzIWHpEWjVTYQxnu3aKPyaMEN
 7h4dD/qNH5kuqIdipJZ8ZawROdtyY1M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-MEl0WU32PxaHEPxMKnkd-A-1; Tue, 28 Oct 2025 14:41:22 -0400
X-MC-Unique: MEl0WU32PxaHEPxMKnkd-A-1
X-Mimecast-MFC-AGG-ID: MEl0WU32PxaHEPxMKnkd-A_1761676881
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87c247591ddso154188526d6.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676881; x=1762281681;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6FRuQL0V5jEYZXhTBhriqZ7fEok/jJhmd8zExR7Hsjo=;
 b=g0xffmMiFncscKCJSBJsiy3W+qX6c8cTIwp4HFG8aPlvFKuiD7GvtXVDwB3TarAuiT
 rL5ttlE56YdNs7LfXpMZhmeqdDBnKOJZX3FgthCTd7itepNGxIIztKcKOVLPiGzt7K5P
 Hm3GRAK9BxSNwZgF7c7oB1+AgqIKQfkot5a7RJzpT5mZkFApDkYTpRNCosFAvpQIZGo8
 yIDoheqEZqItG4Zz1uhlcPEz3HnY90fPN6h+5gvpr/qL7Dls0P/086G48qkmXkCt1bcP
 nbIWhLqzyjjF+eBNcwJ4qlO4EdIPm/yrbUHbL/8NgC+MjgbjEXbxqOCtThJWXA7ICq0T
 n1eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtolsyWQm8xS8g0aUW+3oqGDDQQ7JA2mH0SPm8IyantR/d8HV7Ap1aP+lbKEXhwuq/WBKf7HXCzg==@nongnu.org
X-Gm-Message-State: AOJu0YzlWdXJPx1+i2nCgUcVbdVgBWAmt0PHG6kv41bfd2tFg6rA0XTD
 SvjZY89a0hY0h8WjRXkf7NhqpZ1ul8d45gCR3nSbA6FynZuX5VVAsH8QJUYGYejXo0he2mIb7mE
 my4I6CD4Fmsh76sv5qZUs8uRBqH65IPHXs+Rs/9LEArIqHhSR14OiQQ==
X-Gm-Gg: ASbGnct6o/E9RqroIZ6V3FrIhSzyNYJhnQbK/s0tS0dlB/sxrFHfzuCa5K257+3LX71
 B79SqIagR1LVym9MIVAPmC8NjJ4m4QQ0qMyQOF/YJr82twC4nRTKXfQR0nBQopMTVN1o/Hgockd
 XY1gLZZbNIwMiTJBINhWLVbew5PCfLraynQdMINh0gR/4UT0M1X1Gfzh0rtFur3+NHQco5U5YLw
 3SHOSqPcFqew6xlj+fyoCcayemBPWYRSVUS9HMvz5kCkSTyTfHUPxIltnR1mnVgKoiDx7D311Es
 F0jCp0pQ6vhSGR+9FwZMqz52QJqKtZAnrnsPpOWyVWy7evzGkGjZx+UCm5SNACK0ce4=
X-Received: by 2002:a05:6214:d49:b0:87c:24f3:6693 with SMTP id
 6a1803df08f44-88009b37690mr2049026d6.30.1761676881530; 
 Tue, 28 Oct 2025 11:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkPsEnnE7g1Uf6RH2HEE7aTYdjS7+iR4eial9xlbs8HpB7umH/sACTpW0SpBZTq08cA0PITg==
X-Received: by 2002:a05:6214:d49:b0:87c:24f3:6693 with SMTP id
 6a1803df08f44-88009b37690mr2048446d6.30.1761676880987; 
 Tue, 28 Oct 2025 11:41:20 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc51e3746sm80213396d6.25.2025.10.28.11.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:41:20 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:41:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 11/25] system/memory: Introduce
 memory_region_get_address()
Message-ID: <aQEOTg_6csrNmiPn@x1.local>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-12-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251028181300.41475-12-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DM9wvZZMHwOkwvcc822Y9KYXSHxsd4UqDjeGY9X9zxI_1761676881
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Oct 28, 2025 at 07:12:45PM +0100, Philippe Mathieu-Daudé wrote:
> MemoryRegion::addr is private data of MemoryRegion.
> Introduce memory_region_get_address() to get it,
> similar to memory_region_set_address() to set it.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


