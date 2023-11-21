Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp534017ejy;
        Tue, 21 Nov 2023 07:04:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGdfCO4rI7apr7Xb7lbKphEn01N91mLK0Oi2as8GT+qJevmqCN+gG/4msb6qaZ3rA7j4U
X-Received: by 2002:a05:620a:8b12:b0:778:b0f5:d4e7 with SMTP id qw18-20020a05620a8b1200b00778b0f5d4e7mr11462712qkn.46.1700579058349;
        Tue, 21 Nov 2023 07:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700579058; cv=none;
        d=google.com; s=arc-20160816;
        b=d9kDFr7zV5j6jMO4SmuLkMTBnNNKdB3/ZJm3z37CiX+lXRYswboxp7rl/0AsPT3YlQ
         BKaT3EX68rn3GbH9ok1sQL2sQNJ/0j6mhW7GnRMUwoeycHSLQXAg9wiFp++oX46bMNA3
         iWrgY4y7Q8j8QFbaZyd7LpkAohKo3UGhy+XVw5/iRdjfYsTpyqBqw4JprTrvuKPNB5u0
         KrKgQW+DFYKLfuSiREozqeMrv2nXFUNPF//EqhKa/jsWqFfdlRzpEm+j3OP7w/3Log/c
         dDgV+08eW6qkG+zfHDeFRRSWDK5PkxTx6FN1wzrqe/CSnOOuFqN5xhTC1JXbt+461EGP
         NliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yzV2gdyZdVU2Y4g4r338DfTveOi2Ma2n/9vLEvzwf8o=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=Aoi7tfC/KzVYUe+T028ndYV6f9MGmBuqGWsVRTnp4ITOJ8F84g4XOm2Vy8RAuLzLT5
         Vs6ENG1wjxak3IRwz/252ijUSKW9WGy3nE3IctQgfDfTeEwQPvEp9dLcmfExhFFs4E+o
         Vv6bYQod6K2NJ1Mhp8MKfB12WhoSYVTcYwvMGx3yls25Wo9yNsYveV7KFVHMwI0QH0C3
         FTXTsVIVCxw2AKDXBAMPmHMT7dQUQ5gU6ulTyYKMG5J6+odkOeleMyu6geKSEFsE24aH
         8nSofqKWovxb9nNrDC0trUHHlnPgAgaKLzGAmP7U4W+buEqbWX6TtmGCWH6SihaK65gJ
         4/RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QO6G4Zge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a05620a144d00b0076da7493e12si9301202qkl.505.2023.11.21.07.04.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 07:04:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QO6G4Zge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5SI8-0001bJ-4O; Tue, 21 Nov 2023 10:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SI6-0001Xz-8D
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 10:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SI4-0005NX-HX
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 10:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700579031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzV2gdyZdVU2Y4g4r338DfTveOi2Ma2n/9vLEvzwf8o=;
 b=QO6G4Zgep6ODtMpeUyHXuGNFy6UzFoN41JiR7YcLWMoPQEXPOFDxpb2mDyRi3cGORRLqs4
 un3mXc9zLdC1z3L6La4uvqyWVPlEqhY8kJPlfXo0laX73qopEZ9YdXi+ufHAn+8mtKbbo9
 8HJYT9sXlGVyb3BdbGO8FWzlalKSUxQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-P5Mjr1kTNG-R5bEw-PLmbA-1; Tue, 21 Nov 2023 10:03:50 -0500
X-MC-Unique: P5Mjr1kTNG-R5bEw-PLmbA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-778b5c628f4so76362385a.0
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 07:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700579030; x=1701183830;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzV2gdyZdVU2Y4g4r338DfTveOi2Ma2n/9vLEvzwf8o=;
 b=FCmYrAn3PjOPfUVqRxYvVIhWM1gJaP2o4+x8fy98JZzMo/D+yFd3seNbouLSqnKHuQ
 +ePtDcRSEmYhvbqJXZEhOknXHP+YLTYwy3A3jELG2R6xxiyJ1xT2rwmemJ2d/5LyA6Of
 GeU1Aq52IpPq6mCPYadGUxS5ak0X8TraDywKEd8ZDkfkbB8T7QsxCmSOni58ZFTVU6Pv
 vkVdrzaOIC32awmDp500iQj8sa2wZEMp97GiWVZP+p7JsoUoeRgbgSgPi7v3geMiYMrM
 4IIxpfyykVdioG5JNwUnX67d81/H1X+jMnAhfoSguJ0kYtZB3dX8EVATbOLgrnzF3DFW
 7SXQ==
X-Gm-Message-State: AOJu0Yxgro5Tj8kl7PmbInv6zHHitZhk4eq2Rwu3jTztcFmkI2lWUNYx
 EQijkHkCvdsbfc+sPOpMnR5XfsUsOHJ3DxxKo4NbhNLHTYmR1dOaFu+eVVNzmbhxdO0m9IHIJI0
 jENXPIiEYRGD4
X-Received: by 2002:a05:620a:f0f:b0:76d:9234:1db4 with SMTP id
 v15-20020a05620a0f0f00b0076d92341db4mr11437011qkl.7.1700579029949; 
 Tue, 21 Nov 2023 07:03:49 -0800 (PST)
X-Received: by 2002:a05:620a:f0f:b0:76d:9234:1db4 with SMTP id
 v15-20020a05620a0f0f00b0076d92341db4mr11436986qkl.7.1700579029675; 
 Tue, 21 Nov 2023 07:03:49 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 bm39-20020a05620a19a700b007740c0e52edsm3663745qkb.89.2023.11.21.07.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:03:48 -0800 (PST)
Date: Tue, 21 Nov 2023 10:03:46 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 12/25] memory: Have
 memory_region_init_ram_from_file() handler return a boolean
Message-ID: <ZVzG0iDJ-voJ23Fo@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-13-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231120213301.24349-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Zs7PeWFgC05y

On Mon, Nov 20, 2023 at 10:32:46PM +0100, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

