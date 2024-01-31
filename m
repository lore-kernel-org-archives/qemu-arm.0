Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1196199ejk;
        Tue, 30 Jan 2024 17:49:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELyYHA3U3QGNAYTXE4f0OTt+ugFbHo6NbzJ+wVuMkXkMxRssFIpN9FkVPY6Jotcjx+cHQW
X-Received: by 2002:a05:6214:c28:b0:685:c6ad:5232 with SMTP id a8-20020a0562140c2800b00685c6ad5232mr353592qvd.24.1706665742454;
        Tue, 30 Jan 2024 17:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706665742; cv=none;
        d=google.com; s=arc-20160816;
        b=bvR2+Cje42+xmhm1RELwm1RCjM4GHitQ7EdD8JFWC+IbRYT+DJ5Wel+uoEJb1hQ1XM
         E8GdUYDVqICYZnXUyLSPFD8C5X+hAso5njp+QlPJiNBDmPfPxLUh+JuIGjwGJhojJyZC
         tHBk91we1CvMAKiQLXhyVMD1/7m+oivvFHOrmYfY6p/UpRfAPNZJbPFvsB2VvRpn3WH4
         39bud8jslhttkys9w5XWAITJst3d7F+2Xh+AzbaDFCnCG1ly50531n/8g1qHbWfpRSYd
         QeS7pVFsNA1esakINhD4SbAYRndA/cD3Uho/h0DKuTURYOZSd5UNBB5DsSi/BKMAEhcm
         F4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=GwVZOpYWkIv38F4n8QzYkcfzUqxwluEIlAm74d8UUOs=;
        fh=M7qowhIt4tYLbBO3zWw6OMj/hBrVXlN+VOXFKwv+RfA=;
        b=dC7GBMF4tBykGnBrJCbANuk8lktJiaDDpgzyEDaYbFsmO7NmE/8q3Q98icjjDtjmUA
         Vd+FFW6MoQHX388RBcXv4J6ukfw6sbgUG+FBFrWKckEgNapGd2DEl3UaV8yFbUmVahSD
         TjIJToq2vT1FV/LJDhhpuCHuw/5o2ysjg3Yq7qkJow1Bn/2fPDWB/0NYBrIgvSFcP2yJ
         5oAKWeSTXv1MWP1zenTQDN5p56Qx8bQAgCgwykU3SVbPNhoeUpDyGfqHAXjLLjhDB586
         r2QUhsvgP4xWnf+Drk+eNFawKGCK1HqNRs8CoiE1i3aVcBvWFJgi3uJ5JQynJOG+PmO4
         ZgOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I6iClZbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a05621419e500b00686b151b5ddsi11184015qvc.386.2024.01.30.17.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 17:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I6iClZbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUziZ-0001jx-9m; Tue, 30 Jan 2024 20:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1rUziX-0001je-Cq
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 20:48:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1rUziV-0004n9-M7
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 20:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706665721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwVZOpYWkIv38F4n8QzYkcfzUqxwluEIlAm74d8UUOs=;
 b=I6iClZbYstE08VIhRB0n519JW7OsMg7sHI80p783hj+Rutd3laTPiI+z3tv2wh6YBABvqx
 Xux3S1yCQkYn5CRM+5qEYW/DBKUUURiuVdOYOrLiONLXUAMQZum21wsqXxOfVxDI/TUQVB
 ZPFiaNbYdflMQmq/+EpFVC7ssEfGZuA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-m950YA8xMU6RBzKIcGFKaA-1; Tue, 30 Jan 2024 20:48:40 -0500
X-MC-Unique: m950YA8xMU6RBzKIcGFKaA-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-295b4ab28b5so285102a91.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 17:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706665719; x=1707270519;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwVZOpYWkIv38F4n8QzYkcfzUqxwluEIlAm74d8UUOs=;
 b=WvoRVxT+E0DHuWH9Y1BJLtYR5XA1rGb3Dil7Sv+e/+4JPFIZwKVdYOKTLqTPIqU5Rf
 EX9bG2O6yCRrA0+Q2Wp3ES6FW8znEXICwxxNFvAkhhjhNog65J3OlJo++3Dunuy27Rj5
 QbsWT03GgLVVEcJ+uYuQ/LpWjNt0hf6UmOurb4ORn4PPnZQ88va0pJvyOAvorXnazu4a
 iUVGwIXur9Mzan1oCjN9/9E2NGnRGSJXbkjlsdMFid9CGrGJCmvNpgA7Yyd0/1h16DiO
 wdnkqruvEPUZSpH/ctWbG2WGfxgV8QLKEZkiKFaAIrgx85QR8P0oY4pb8NYrJkSE/Uut
 9bWQ==
X-Gm-Message-State: AOJu0YxFfK4/Nq1F+rwzJBnXiwDZo3ERxHMd8RZBRtGdrNyLcai7zxNP
 17c4AzWymwLYd+OfgzTeZSEtiz7rC10eGy5jiUl1jTh5TsifZbgZX8jaIKQlT7Wzc0UWJG4QipH
 FU9RtKe0zyrqmeDkKyz1n3PwxG/m26N1lzqL6NH9lrxrC2+4UxQ==
X-Received: by 2002:a17:90a:c906:b0:295:af17:239 with SMTP id
 v6-20020a17090ac90600b00295af170239mr471629pjt.0.1706665719149; 
 Tue, 30 Jan 2024 17:48:39 -0800 (PST)
X-Received: by 2002:a17:90a:c906:b0:295:af17:239 with SMTP id
 v6-20020a17090ac90600b00295af170239mr471614pjt.0.1706665718692; 
 Tue, 30 Jan 2024 17:48:38 -0800 (PST)
Received: from x1n ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 t3-20020a17090b018300b0029564dec437sm71613pjs.6.2024.01.30.17.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 17:48:38 -0800 (PST)
Date: Wed, 31 Jan 2024 09:48:31 +0800
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?=E2=80=9CWilliam?= Roche <william.roche@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, lizhijian@fujitsu.com,
 pbonzini@redhat.com, leobras@redhat.com, joao.m.martins@oracle.com,
 lidongchen@tencent.com
Subject: Re: [PATCH v1 1/1] migration: prevent migration when VM has poisoned
 memory
Message-ID: <Zbmm74bJ7Zk4HUR3@x1n>
References: <ZUwCZdZj-vZD1NJC@x1n>
 <20240130190640.139364-1-william.roche@oracle.com>
 <20240130190640.139364-2-william.roche@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20240130190640.139364-2-william.roche@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2UiizOpC4WOd

On Tue, Jan 30, 2024 at 07:06:40PM +0000, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> A memory page poisoned from the hypervisor level is no longer readable.
> The migration of a VM will crash Qemu when it tries to read the
> memory address space and stumbles on the poisoned page with a similar
> stack trace:
> 
> Program terminated with signal SIGBUS, Bus error.
> #0  _mm256_loadu_si256
> #1  buffer_zero_avx2
> #2  select_accel_fn
> #3  buffer_is_zero
> #4  save_zero_page
> #5  ram_save_target_page_legacy
> #6  ram_save_host_page
> #7  ram_find_and_save_block
> #8  ram_save_iterate
> #9  qemu_savevm_state_iterate
> #10 migration_iteration_run
> #11 migration_thread
> #12 qemu_thread_start
> 
> To avoid this VM crash during the migration, prevent the migration
> when a known hardware poison exists on the VM.
> 
> Signed-off-by: William Roche <william.roche@oracle.com>

I queued it for now, while it'll always good to get feedback from either
Paolo or anyone else, as the pull won't happen in one week.  If no
objection it'll be included the next migration pull.

Thanks,

-- 
Peter Xu

