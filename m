Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15127CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:41:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDodT-0004w0-VI; Tue, 28 Oct 2025 14:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodP-0004ey-QJ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodJ-0005mO-9Z
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761676875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbdFtFheFozDA/Dq4cgI2dg6cbI5rnjMpYsY6r4xZ7A=;
 b=i7MJ0UzUL2ImZ43MFK9FrJl8ih9KMPJg2rv5uTjMdFeJF/t2gNMT9QSeN5vitBnkLG7qfv
 kVuMrGpy9iLlprqZ2+iVhi/s4RnOmktgbtGrZZRwDpN2L79bh2RvfC5iR44SCF7uepkLp6
 ZvsUf2+0ktwPVxQAPUgWdR9EA0lCOow=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-d-Fl8-CnP3ayz98VIBscsQ-1; Tue, 28 Oct 2025 14:41:14 -0400
X-MC-Unique: d-Fl8-CnP3ayz98VIBscsQ-1
X-Mimecast-MFC-AGG-ID: d-Fl8-CnP3ayz98VIBscsQ_1761676874
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8a27ed89773so861305685a.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676874; x=1762281674;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LbdFtFheFozDA/Dq4cgI2dg6cbI5rnjMpYsY6r4xZ7A=;
 b=wCn2DWLCr94YK0czOe3XEbwDMIsMczb1fidFVsf/7TlJOkX44CbIjfPqz7eHfA+e21
 MqUN1WB7oW2rW0gZOAxEbSB8smKxLliW/6mulpNS/XvRY0261JGPf+PLnhoRtgulpm0S
 o61LxwZh/YJIMCggqTx3iYnmdCakcqRpC663C9KrQWYsIUA2yGu1K6hzdiGPncfeq/rR
 tHeO1i9ZnkzbIho7mU8xAKST4t7C8XOJpj+rxhrHXVJxT069UiPC8sjY258xHGxyBhGr
 5Y10lfUXYn8KnzlR80xoPYStu+neBFpR4TsenbXqwfa4SyBVFPFWzPTRBkFqXj979kxU
 oYbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNqbZ4d0+O0B6BwqkfpMsIGXF/FKN5YkC/uosI0RJGaFPzvnheTs5Qj2rBFL8pHyEsNTkzL2QZlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGVqX3M3V3JsfnW9jj4fqtqJGVHZNKDuQLVCjc5KfFWfFnyuNM
 M0MTDuGPvzBWjUDQxTAQ7QY6xpajhZiNtD6LaPy4ISG4tqSBw7nIGXjq33bxqw6H5leib1ybgr4
 16Mnzpe1CvTICH2Hsu46O+L/X7HdHCqwPHbFoiWFExxyhx+j8oPa5bw==
X-Gm-Gg: ASbGncvg25zaKvduOI/Ct4dN+u40x3dSyZ7RPYmkQG79kz/6vaYgFOHn5tfOTb7dTUp
 MVeipUySU4R9wIKlhXnFHqI6qDI3tUBcMgqHc+aTKVq9apUihvIFucDPWlX35kjv/aX8h6XHase
 PegZyocooIhxmr3bHhYqLYfKS2N6V26XwHpcq/tF0DtNrVD0J1Yl/V+wY1zHCvN+xcq/MaxXq+f
 3KEWj/X1sHQboeAvc5H6SZCDmyFmUt+8IDrG4MgcMfQYEMzB9g/j7ItVqVaYAvKac1jzgSReduO
 6dHke0yQGlWVQdDSCUljnRVQCDGVegtnrFpr872IatmCl+B1vR1deQ7LBEfDuk/aXMM=
X-Received: by 2002:a05:620a:4512:b0:89a:2f2d:f951 with SMTP id
 af79cd13be357-8a8e6954ac0mr49383485a.64.1761676873660; 
 Tue, 28 Oct 2025 11:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExlGj2eHAfl7Q0UihMJQXKFKYGcAui8Hur/E8eN5n88UQ5+B369cHASvyD7Eab3tZKhyEqag==
X-Received: by 2002:a05:620a:4512:b0:89a:2f2d:f951 with SMTP id
 af79cd13be357-8a8e6954ac0mr49378585a.64.1761676873101; 
 Tue, 28 Oct 2025 11:41:13 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f24ecbc11sm891450685a.24.2025.10.28.11.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:41:12 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:41:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 10/25] system/memory: Have memory_region_size() take a
 const argument
Message-ID: <aQEORt9fVYQm14O1@x1.local>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-11-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251028181300.41475-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rG-sp6-sg3CW3vuYclZoTUqKwxPmmz8nXGbCR5wfXW8_1761676874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Oct 28, 2025 at 07:12:44PM +0100, Philippe Mathieu-Daudé wrote:
> Since the @mr argument is not modified, it can be const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


