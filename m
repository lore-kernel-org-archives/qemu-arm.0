Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp702360ejb;
        Sun, 29 Jan 2023 20:45:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzIIbAJwGtBqlOFTlFMR4eatjVkwirvbbPTh6GclZNOz96oFC13/iPJ4qhxF6HCIu3YYNE
X-Received: by 2002:a05:622a:190:b0:3b7:ec70:30af with SMTP id s16-20020a05622a019000b003b7ec7030afmr44249083qtw.46.1675053950434;
        Sun, 29 Jan 2023 20:45:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675053950; cv=none;
        d=google.com; s=arc-20160816;
        b=usyViMb8Rl7Lv9SgCqSqgfAc+sNBAuHHzCdJ/EcHKMEA+2SZPIH0ilL9jHUSaAkme5
         45g4KRcLayi1BcN74QSaGQv8UFjuORQCxDrFT7RQ0at+94jpRs88XpcX8geQvBj3xRzk
         M7hUyI4p2Z7tMmsEUxAMF1murx33p6v8LmXLmXMoM0XALV0yoWV3ZH0H1lhB2qpNQHoW
         YJSyNRjBN8ly3tf4ByxHGHoATgLB0YfN6nBgesio9i7aW8GeWXZ/E0at6+01bcoWSTUy
         hAGHHufjdsnEDWnCORgTBdG1f5NGZLK1LaziIevOkg5dQKjxbBGhK79G/3Z0ZzJas9YF
         NiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=QnZsA1EFFDQZ4GA0eiKICktlxR6/RkD5vBWiSbFtjqc=;
        b=i1kv3Uf99T5t/hCCw3t1MXJwTnUDfq+0C9wrfcdaFAPM69b3Gwam+KtjCG9NOGZVGw
         SEvsRcSY8mcqwkzBjCNbzHHFvVQ/5WhuwnQDrkzSs5kDEJeTbZBsaOhl2sfQrLq4Upm9
         hxlxC4qcB1eQJflvogiGkVlD3esM0tFylOOYvOzx/K/GM8D1cQ/F7xbxofa/s2irRGYj
         gEJO21E5YaPGfEtfhInItI1EZOkZR09Arvh7AIbJ0xkrMc6T4LsPkGW3S8MugNaC/wbe
         qp/O40/BRwsNIoWuvlUc84tQtAhk/vTFkDQqRt2A+zMsSGJxFzAHIjMFCG2fmfImlJfY
         21uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UgyFi1Ks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05620a02e700b00705749eada1si6319923qko.92.2023.01.29.20.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:45:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UgyFi1Ks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM39-0002gT-1E; Sun, 29 Jan 2023 23:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM36-0002fa-JR
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM34-0005yf-BT
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnZsA1EFFDQZ4GA0eiKICktlxR6/RkD5vBWiSbFtjqc=;
 b=UgyFi1Ks/Zmi/7A9FbWuYJr6zZQXTRWg3AYh1vTRzj306OyMD7hdd8bbAFctkXvbH7Bokl
 RHTnA8CYh6R4A3lmn+TIz3wdhhfgCN51OiLGFlkI7XOSyEPK0bLoMaWPbQumLWunhu/ogq
 RP33gdbS4z5K0lNPrGdXPFhzbSQncl4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-dkGG4x4LOxirxuQTkrJ0Wg-1; Sun, 29 Jan 2023 23:45:40 -0500
X-MC-Unique: dkGG4x4LOxirxuQTkrJ0Wg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r6-20020adff106000000b002bfe5fb9649so488341wro.14
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QnZsA1EFFDQZ4GA0eiKICktlxR6/RkD5vBWiSbFtjqc=;
 b=nq330XfI8Md8n3lEeVkhTqkGplW9X+bZBfLSxnkTvvP+JLGSFBtoyUFQyVpRkf8nwZ
 hYTxcMLUcByi/GWtWYuqyKSxtjjjF07RBhXKHdZPSCCPCXNDhr5zLgnqimKaDq1JfVX1
 DJZhqHOEfqfg1t2qoCoXWHfrISLBlF4Ki8TfM+378var6Cu6irumXvgWmt9WQ+qyI0Jk
 USeDZW033ZSCU4TnoF2s7zTs7RgZWdJR9ojIh33U7KbpCxVOfpgnBuBHPWbdLusPgVmm
 dcZlpfTbVmEoPqKZEChOG2tCtB2JMG4XPAstELEzKnoCz607YEcDLVGaIMUyh0BI7tMH
 SUbQ==
X-Gm-Message-State: AO0yUKXick9UtLJ3I7dPtuosTV6iGcV47xaRDP3MfAi+7gIoAgGgql72
 aKodYtkvc5V7aLhCF4MWZfBtib62ZfXc6eERTVOHDAERpNb2ne73mobIZfodLTCO77QSyoU9m4i
 P8V2l6XHbP5Q6
X-Received: by 2002:a05:600c:4f93:b0:3dc:2b62:ee9f with SMTP id
 n19-20020a05600c4f9300b003dc2b62ee9fmr14597263wmq.3.1675053939085; 
 Sun, 29 Jan 2023 20:45:39 -0800 (PST)
X-Received: by 2002:a05:600c:4f93:b0:3dc:2b62:ee9f with SMTP id
 n19-20020a05600c4f9300b003dc2b62ee9fmr14597253wmq.3.1675053938918; 
 Sun, 29 Jan 2023 20:45:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b003dc522dd25esm4047636wmn.30.2023.01.29.20.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:45:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
In-Reply-To: <20230120082341.59913-8-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:37
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-8-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:45:37 +0100
Message-ID: <875ycomxzi.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: buYogtNG4Ig/

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Part 1/4: Convert memory & machine options.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Much nicer.

Reviewed-by: Juan Quintela <quintela@redhat.com>

