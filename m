Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C89CAC5B8
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 12:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5Nl9-0001VJ-6j; Sun, 05 Oct 2025 08:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5Nl5-0001V1-3w
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 08:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5Nl2-0003Nb-Nh
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 08:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759666948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uH/GB8TaEG7yh514K08ygSmxD+EPnFiaGKf1haB0Uc=;
 b=PKrlEoyYHkArN35Q/oX+xWSxMP2aRcDZL52E7FkppldT7W/ALKG3Ngc6+O9BmNKEOo802x
 U9fT3WeeZnwvnw8XHBsTHQhWveq0CpT5KC9R4g5lVnNA7hefimtneM/bBAgMbeoUaL/3wn
 hYvVwt+5sS1bk70Ionat4JNN3qg9w20=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-UIpyvSrTO2uNlorQKwythQ-1; Sun, 05 Oct 2025 08:22:26 -0400
X-MC-Unique: UIpyvSrTO2uNlorQKwythQ-1
X-Mimecast-MFC-AGG-ID: UIpyvSrTO2uNlorQKwythQ_1759666945
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e3e177893so21748365e9.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 05:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759666945; x=1760271745;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uH/GB8TaEG7yh514K08ygSmxD+EPnFiaGKf1haB0Uc=;
 b=UBbbnX6rYMNAWXfLAio/ZE0S6V4V6Q5UTJTvJH6dj52P+eKDgBTgGiMDE+BiWhSFar
 C6+mv/HF5wMkyGOuIzsZF6aU+RZtyeWq/dgfunqOnyoOz0povuSoxSl1GEn3OqrOZnEL
 8WNnhZcX77SsbXaGVRwqZCxnS4PFdDhQDO/UV1o/wZdS1ZhBm7mNbHGjiUHF3mccAb6S
 mmUv0gExwET7E49cUOU71scLReeEVXqE+rSCPHLFKTj+wS2DE5chqZ41FmNtbv/lMqPq
 k4CBhMttY+2H6n/9V1wK2oUkEQMp17+d0hdCvDebCUq1+wakf+gH40SA6qtmJdA4VcIM
 p8HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU860FSOsRsUlgLqm1k60YksnLRwimugpwIzkIwbv/WuWMmsGHLlE+3hnlq2Exr+KbhKwBdYU0kxQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOl+USJEWvx1IRwlhRTuJc/AkoW/bFPBCwPHUlRckjrTSTdIOc
 Azg28fvjg/6tgkLZ/+wz+onl1pCbprYdYReSQgG5+LAJSS+olIjuQ/SOdwZQ0MOo/pmu2wxrvI/
 popf/0XdSBAFQI4pFkJ1tPKDcpp8p/owxiabODdW952A7s8f1KxYdOA==
X-Gm-Gg: ASbGnctyCQ3+gTIwwf0mo6zuoxxY7kei8SdXNXv/Cet/16f8FSTPE85xXDkiHha/yNn
 hTZjO+UkWiyxlaUfDtUEVMTplXyeBMOcbZHABEPb7ioH7XYqSBkk9MBB9gQW6S9LCoJWhX2NUJW
 GclQ0+6mDXJxEwKnVAKpAkzCrsADbHbrWRYJzyyeROK3TYI1jhsgLwTn/q3G0t00YUcID4q9uyB
 Vrybhy21eEqhWSR1qbrE2dx8Nd3/W27fhsvA/DHRNiYOit5f0ZqTi7GWikD6lZjqjRjzBF3vE4T
 IuLth+YE7VvViNBP6nnIGpPF7Pziy6qnVGxhR7A=
X-Received: by 2002:a5d:5d13:0:b0:3f7:b7ac:f3aa with SMTP id
 ffacd0b85a97d-425671a9021mr5205856f8f.29.1759666945422; 
 Sun, 05 Oct 2025 05:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG1keuMZu665iO+IbiJSlMHjR2azOMigBt5fMWxeSQ4NRIhAMCkxk2rk3nz8YU5tZ4uo9RPQ==
X-Received: by 2002:a5d:5d13:0:b0:3f7:b7ac:f3aa with SMTP id
 ffacd0b85a97d-425671a9021mr5205842f8f.29.1759666944911; 
 Sun, 05 Oct 2025 05:22:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f017esm16660799f8f.47.2025.10.05.05.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 05:22:24 -0700 (PDT)
Date: Sun, 5 Oct 2025 08:22:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 17/17] scripts/ghes_inject: add a script to generate
 GHES error inject
Message-ID: <20251005082027-mutt-send-email-mst@kernel.org>
References: <cover.1758610789.git.mchehab+huawei@kernel.org>
 <5ea174638e33d23635332fa6d4ae9d751355f127.1758610789.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <5ea174638e33d23635332fa6d4ae9d751355f127.1758610789.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qnBDra6PFvjKQY_Qh9nQyGsn3Pgkn79lqI5rcpIGfCc_1759666945
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 23, 2025 at 09:04:11AM +0200, Mauro Carvalho Chehab wrote:
> +        # UEFI N.17 Integer values
> +        g_pei.add_argument("-m", "--multiple-error", nargs="+",
> +                        help="Number of errors: 0: Single error, 1: Multiple errors, 2-65535: Error count if known")


While I'm merging this as is, I ask that you please address these
unreasonably long lines in this patch by a patch on top please.

-- 
MST


