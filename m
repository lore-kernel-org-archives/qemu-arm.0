Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F3CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 21:37:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL6uN-0002zU-9x; Mon, 17 Nov 2025 16:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vL6uL-0002yJ-PH
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 16:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vL6uH-0001VK-GA
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 16:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763415423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUrXsrOEYCDeXvWB1vmj4/9WZ8aTvo79yERF3k+T32g=;
 b=LQHIGqQlIJdK424DL9KazePPDsOoLVgro+vv8HQ/gID7dulLSmfvXiD90ZyTQ0hIH+kU+X
 YGwAqjP0bzYS235kuvNeEnfXqIStAVBz/VSWIeis+mjEtQ1ipUyFSwQb4+PiN/+STKZiSJ
 2zfy+3i+yy6LME6n0UCyHVWdNOEv17M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-JfhzvblcOUmKRMHYlQ0ehA-1; Mon, 17 Nov 2025 16:37:01 -0500
X-MC-Unique: JfhzvblcOUmKRMHYlQ0ehA-1
X-Mimecast-MFC-AGG-ID: JfhzvblcOUmKRMHYlQ0ehA_1763415421
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88044215975so176100696d6.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 13:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763415421; x=1764020221;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUrXsrOEYCDeXvWB1vmj4/9WZ8aTvo79yERF3k+T32g=;
 b=E4gBLv/+eq3Ab0931D0QE3im6JcW9b9LI89RKrFFm35LB8AOb5iAUB9a1cZYXNkuBj
 gh04YEAwr1xzY1jmt5W0Wip106u7xap9fYkOEso4Y/rCadn1jShZ4DPmKsw7x4UQWowp
 YdoxFYQ+wDEIc17GPD3a2lwQLVuGtcnwRU7LlEWER3B9ngryLpJjO2l35VKGJtZbYbKd
 XQOLUhcBLDV4AjJLN/6hnV/ddDOGBpXcW7nsQqujV0tZCoDJTGEX0wkUe1nYgiemjOKW
 522N5Pp2AYLEmQezEYSFLou9jzbrc0WAUAr/UzzcslpM/uKgOjmvdDQxX6sQ7fhzLwsB
 RhUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX3JOnURqarCvghOcl/wLnCipL7AgL4pUHBQ8pbsG1ID2hvV4qS32xruyijSwaIVetifDhAXMFhQ==@nongnu.org
X-Gm-Message-State: AOJu0YwfGYS2YvWX4i8Z+8DY6SpA/9815gTwPw6WxYxqhjKmioUqFjUW
 AgA+J5lrV/7nJ87opT81d5A+DoAI1L8pBQmaAogCzW/J4MXyt7LnJGdS8QVxn/FFSdpKgFb72aw
 IzEqj4fq2TeJPTAJAvzz780jqGcHoecjftiClb35Q0qlKPtxVlGDN6g==
X-Gm-Gg: ASbGncuV0l2cxGFVpgNkQ78CaC2+K+iftjkDrRJBdkmUmjNjNrnIUa9OgLa96iqBiPN
 qCh8b+OXcIV+dSaHdq5fcN9qF5lf8BckyPrLHqkcJZ1KjrpLfC6fLs/Nli2OUSkpKvyHmYsSRW8
 gGOuIt3bOLVY55k1roLwUEdogAmYRFmAMJVDSp6ruYOtsRLf1yS4FioNp8Hetud9OKmqjtC/sfU
 NH3SmadS50p1veecyYsWkaZo/gx5qu5SZ8Fjnm2sHKmK6vOaoBPTOENstKQ2TRCOAtpdUbicK2s
 VavbfAVgYgwhVyE+phsSZPfQcMT4p48xO8FhmP+sBvIr2zhWhIjnt2Hd3pega6/+tlCgzk5dxUl
 ebQ==
X-Received: by 2002:a05:6214:21ef:b0:882:3c65:1cbe with SMTP id
 6a1803df08f44-882926132b2mr186628446d6.28.1763415421259; 
 Mon, 17 Nov 2025 13:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+z5kxSqrAgFWhsvveasQqjWvCvGo3xs9eXu/xnyKTkwQzvvjxXjldT81lN8U2rDJrpMBmUw==
X-Received: by 2002:a05:6214:21ef:b0:882:3c65:1cbe with SMTP id
 6a1803df08f44-882926132b2mr186628216d6.28.1763415420843; 
 Mon, 17 Nov 2025 13:37:00 -0800 (PST)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-882863138c0sm100494086d6.16.2025.11.17.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 13:37:00 -0800 (PST)
Date: Mon, 17 Nov 2025 16:36:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Nick Briggs <nicholas.h.briggs@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH-for-10.2 2/3] migration/rdma: Check ntohll() availability
 with meson
Message-ID: <aRuVeBtzS9r3Oypr@x1.local>
References: <20251117203834.83713-1-philmd@linaro.org>
 <20251117203834.83713-3-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251117203834.83713-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ceerr_0vg7t6TbT4z7bABBIEEpY6K4V6cxU54mThqeI_1763415421
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

On Mon, Nov 17, 2025 at 09:38:33PM +0100, Philippe Mathieu-Daudé wrote:
> Commit 44ce1b5d2fc ("migration/rdma: define htonll/ntohll
> only if not predefined") tried to only include htonll/ntohll
> replacements when their symbol is *defined*, but this doesn't
> work, as they aren't:
> 
>   ../migration/rdma.c:242:17: error: static declaration of 'htonll' follows non-static declaration
>     242 | static uint64_t htonll(uint64_t v)
>         |                 ^~~~~~
>   In file included from /usr/include/netinet/in.h:73,
>                    from /usr/include/sys/socket.h:32,
>                    from /home/f4bug/qemu/include/system/os-posix.h:30,
>                    from /home/f4bug/qemu/include/qemu/osdep.h:176,
>                    from ../migration/rdma.c:17:
>   /usr/include/sys/byteorder.h:75:18: note: previous declaration of 'htonll' with type 'uint64_t(uint64_t)' {aka 'long unsigned int(long unsigned int)'}
>      75 | extern  uint64_t htonll(uint64_t);
>         |                  ^~~~~~
>   ../migration/rdma.c:252:17: error: static declaration of 'ntohll' follows non-static declaration
>     252 | static uint64_t ntohll(uint64_t v)
>         |                 ^~~~~~
>   /usr/include/sys/byteorder.h:76:18: note: previous declaration of 'ntohll' with type 'uint64_t(uint64_t)' {aka 'long unsigned int(long unsigned int)'}
>      76 | extern  uint64_t ntohll(uint64_t);
>         |                  ^~~~~~
> 
> Better to check the symbol availability with meson.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


