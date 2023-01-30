Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp693376ejb;
        Sun, 29 Jan 2023 20:13:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsOFoNdvClWBcvs6t7MnR4++8fNKoBViw0xw5+O0nLVvBUQeVR4yPqxPKhLeBEsUP/vpb/u
X-Received: by 2002:a05:622a:1e1b:b0:3b6:317f:2d5a with SMTP id br27-20020a05622a1e1b00b003b6317f2d5amr66730981qtb.29.1675052026820;
        Sun, 29 Jan 2023 20:13:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675052026; cv=none;
        d=google.com; s=arc-20160816;
        b=LI7eScqiqM5eOetXPBNVsfxW/4bHDkOwJb79FFdwyR2KHgdjX3qMKQ1iNIpMT6qjGV
         yCb80JM7v8kzM+amJ1qyqVjfa8Ie6LmwseSKujzQLUbz7ZYbYOZ7osUXUXDpN++GDHkQ
         +A/F5YpCL86kf2/iKXEB1x2zfJR01nN0Zv9jB50X9nQ1Vfh2ShYXCLahUXDXkyfjzCef
         nVoI+LBTl9kvql1//spcf+NHVhWi5YYgA0SVjr7/a8MqPu2FEp9PVH8aXwkcUDDT/Hy8
         9KsEbIJMEg5K5JZnIaI5iHFJmmw9U5HIJZMHg4tZ5Q/d8uSXi1MluOF9+jEiW4AOrQDr
         KBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
        b=tq4MK0AwKOMizIPJD+wegtNVauwqvkRZMNRS3cn+ilYYuCJT+Pg5rcKXh0Lskb2SZk
         TTj5phJOcRUp7otVk75fetOAoMrn3aAXQWxe6gGgGjDK3RvFEfyZX48qh9CRN2gSOucL
         B1Wo8QUxZyH0snatWz/YZRnZXugwMq/FCQFB1KDUe0bzYrNExqXqFj3UwCin5B097rf4
         0T3WjWiItl/Kss1tcr3O4+Li9siV1QDxvCNacZ2RXUSMGWwsN0uvdscVgDqG+SrFD4qg
         5H5lI3IpUqQRLhP/WZBUtQpPszVh9pSWiqmtts7//KhJj9Fj8aYY5BD+3h+rQmbXTU7A
         Fv8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+KvJM2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020ae9f215000000b006ee9af422b6si6050881qkg.226.2023.01.29.20.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:13:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+KvJM2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMLXw-0007se-RX; Sun, 29 Jan 2023 23:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLXv-0007rg-2H
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLXt-0001KV-R4
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052009;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
 b=B+KvJM2DsWGyvFqOL35CDCBHq7tY7R4YuN9PqVRbhv93UplLPglnEbl1QhkME0ugvO0Yy9
 MPUSCyD1scsNSnzDdfxsRjRZGd0KQ/YIcGPX8Px97L+R/So19r8lf7aG+0zNnNU+xdPRxw
 9aLZB9FQREu9hyC74UA7Dl0j+iqs0zg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-cNdZx4zYPvKhru-K53pGtA-1; Sun, 29 Jan 2023 23:13:25 -0500
X-MC-Unique: cNdZx4zYPvKhru-K53pGtA-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so1799967wmj.7
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
 b=EZ8ngwQPI+sT9eWN2onP7/C0ZfMXXyxa0geYIEfuGKepZ4N/s9rPYBsJf+OQwHuctu
 6rq5LSWlpTEmN9fWXdeFBy/0j/x4X5wcAjI0joz3IhUMam7HbFmTBS5D3ud113weC1P2
 jxgw+HAQ2RrGPwbISHJLSl78LPL5inXMUf3wHe/ysqMQyuTW9/c9sMLEocBcAc+3AkSS
 w56qeJkXcjRR3Dky7Wq7yRZWB1AxHmOUTSLakda8+nmGD4DSTwFDqZPvYJjH0afOjNgc
 LuyoN8RpehvAJ21GDn3E5loMJNjjO04TnlPXQFvkeziHrfCajZmNl4UmC6+4GLLqgma7
 fRzQ==
X-Gm-Message-State: AO0yUKXEGar22Z1tp/3vnikMImFQkUbtYj0etXW2vhF9N9orjMtC2QCf
 n4s/5Yvpjei88vbH7nWsTwNq47XaGhM8thHJliSthaq99vsIrPC1A8Sr0G75QnMSsKKY3ZVAicX
 5ixiD2FGbvKRy
X-Received: by 2002:a05:600c:b4d:b0:3dc:3f51:c697 with SMTP id
 k13-20020a05600c0b4d00b003dc3f51c697mr9491286wmr.18.1675052004048; 
 Sun, 29 Jan 2023 20:13:24 -0800 (PST)
X-Received: by 2002:a05:600c:b4d:b0:3dc:3f51:c697 with SMTP id
 k13-20020a05600c0b4d00b003dc3f51c697mr9491262wmr.18.1675052003885; 
 Sun, 29 Jan 2023 20:13:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003db16770bc5sm3110464wms.6.2023.01.29.20.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:13:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
In-Reply-To: <20230119065959.3104012-17-armbru@redhat.com> (Markus
 Armbruster's message of "Thu, 19 Jan 2023 07:59:56 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:13:22 +0100
Message-ID: <877cx4psm5.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
X-TUID: JPqQwgS8wXbD

Markus Armbruster <armbru@redhat.com> wrote:
> This commit was created with scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

