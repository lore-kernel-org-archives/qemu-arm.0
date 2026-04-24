Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD5DFE5209
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 11:36:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGEpF-0000s9-TJ; Fri, 24 Apr 2026 07:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wGEpE-0000rn-Sf
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 07:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wGEpD-0006IR-FY
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 07:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777030558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zYlyk/FU8jAvtu3n9b+43GgXp9tSPuBcVYejaiINyT8=;
 b=H5BXmgAfo7sTnkPOaTfPp5NCDdrjlikmfisjk0SAHyKPN+w8/i1w1qr2DaFNL0knqbZyZ3
 /h4pnkRe6VCqo4GAoJsEs1jsCC60ZMhdiBV65gbXc799shx3vzvldw9C+wKE+4vrSC6J4J
 L8OySGxvXWI18esCOL6QuTOj849y7BI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-8eaPLPHrPmCgIa1BtpFYFg-1; Fri, 24 Apr 2026 07:35:51 -0400
X-MC-Unique: 8eaPLPHrPmCgIa1BtpFYFg-1
X-Mimecast-MFC-AGG-ID: 8eaPLPHrPmCgIa1BtpFYFg_1777030551
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8d5b5d607d1so1519041685a.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 04:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777030551; x=1777635351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYlyk/FU8jAvtu3n9b+43GgXp9tSPuBcVYejaiINyT8=;
 b=Y6/3dHViF6auvfve2zTZEttwxXl4LakoL3sr8QPfDIgT49KHoRtvKUfOptG+Slq5zf
 +pWhOnTnZVGmGIfEGi2tInjOsIkDBr4Waxyeo4rau1yDbR+Tw2gKaYLxg8YWkRljlOX3
 IIIjhXeBP0oM1pU2J6cCSCw+fLnXAfVpsyUX1nEj+QlLM26SIaejHz4E112dVB1zSj89
 PzWbC3spQZQy0wJMFNgsFCwo1EMcNprJCJMjExrRwFtlhkigayeD8OI2g/TyMdOeQTir
 7fHNmm3nZvtlf6oZhY06QzUVjKvJZnXqBdJ6eNql09G3YVUrNTDmXJj0dYrkm19dqN+b
 KRpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CREeAre+teSGIeEc5DQmsRwHKbZ6CN7AnUehWdG25TDE07jGBv56FbhIREE5M8QoI+6YnLZRiyA==@nongnu.org
X-Gm-Message-State: AOJu0Yyts+Z/CiWT5bk35aa1B0yBEwOfKZZuy0LFJy4Qv+ME5U9/K7xp
 c5oVGAYJowDIkaa8bZ+604ay6qgGKi7FZ9Ymd5ZLsgyWM/1laKZQG0u9ocN28RAIJAnAHt5wYeB
 0w7NlBcGv+JjNgzJKYTd+2TnssIe51zu0AArIxq6YVuxdWKB7hWIjyg==
X-Gm-Gg: AeBDietnNE13pdDID8g1CAOB+xNl9j5s63+rdw8YckNXMsQJUyq+UtXIUPZ+0HcObZ+
 rDQjIDnCs1/floPN+/4Yg6r/UJ+5bOTDV0lwzai0PjLzcwMQPWAdZxKfbbFEYe56Wm57CLs17r4
 z6xIGSOIawYxFZpA5RdjpMbK5fWLv1AtAk/MD8j+aPChaSwVdSLaG9hapaZxjY+lEULjUw/g/6C
 DBkGjJ4KYe1zRTGwrSxN43p+2zFN+ydTfjRpvVSqUWPJw+fxvh/vJey4UVPeBV2WNn0qf4RCmB+
 /o7Ou7xz7YfWJ4wi7Zo18Vj/btrpRhdl/aq6u2FINPnWFfsL6xMZdLln+FSIS5OqxInZQxiwDDr
 iKCqh+BFUomOLHUpgT4z5sx3xqhh3t4eSN07z4cSKery6LDCvCOVf+85vUw==
X-Received: by 2002:a05:620a:319c:b0:8ee:18e7:9406 with SMTP id
 af79cd13be357-8ee18f6e17amr2519714185a.29.1777030550994; 
 Fri, 24 Apr 2026 04:35:50 -0700 (PDT)
X-Received: by 2002:a05:620a:319c:b0:8ee:18e7:9406 with SMTP id
 af79cd13be357-8ee18f6e17amr2519708985a.29.1777030550418; 
 Fri, 24 Apr 2026 04:35:50 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae5eaf1sm186134476d6.30.2026.04.24.04.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 04:35:49 -0700 (PDT)
Date: Fri, 24 Apr 2026 07:35:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "philmd@linaro.org" <philmd@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, "farosas@suse.de" <farosas@suse.de>,
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
Subject: Re: [PATCH v5 09/18] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit with migration compatibility
Message-ID: <aetVkymHe-Gy3vBk@x1.local>
References: <20260424080508.53992-1-jamin_lin@aspeedtech.com>
 <20260424080508.53992-10-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20260424080508.53992-10-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eATQBIvWOlQh7iyTPyGyCJNKEyw6djNd711UwmjFfTw_1777030551
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Apr 24, 2026 at 08:05:21AM +0000, Jamin Lin wrote:
>  hw/usb/hcd-ehci.h   | 17 +++++++----
>  hw/core/machine.c   |  5 +++-
>  hw/usb/hcd-ehci.c   | 72 ++++++++++++++++++++++++++++++++-------------
>  hw/usb/trace-events | 24 +++++++--------
>  4 files changed, 78 insertions(+), 40 deletions(-)

I skimmed the migration relevant bits, it looks all fine now, thanks.

-- 
Peter Xu


