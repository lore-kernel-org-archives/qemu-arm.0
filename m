Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2097566ejb;
        Tue, 5 Sep 2023 08:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzoAq6HXJrPgmtkT/egb0TTNT6iulbykKLFr3Ek3yFMwLNAEYb/imj0HSZLPDI8zxdTUao
X-Received: by 2002:a05:622a:348:b0:403:ab73:9d55 with SMTP id r8-20020a05622a034800b00403ab739d55mr16591416qtw.6.1693928846627;
        Tue, 05 Sep 2023 08:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693928846; cv=none;
        d=google.com; s=arc-20160816;
        b=fqXimTxnq0I395TRuSZqySXXlEhbOFTo34hizbpHjSPFcW3XAMmtUp7lNrs7oK4MVm
         osa8eh23qY7eZZDLTdg1tfgM0YHnai677Om2jnnG5CEV0CioHxBJrevU5YTrM73fdrDL
         FwzDzN81FsCShkENBE3CNdYdy97b8e0s2acBXgFyxx/R9UV3dk+u1mtC5TDXnF2KaA/F
         ur2DiWRtcVDnsslWrIfhXzPTBxQewlfFNjjPYwUfSWzo4k53jn73FKsoxjeOFw/42CZV
         oH7V0SnHDg1zPoRyVXg3qij3oB7PEIqjdhDklv8pHazq2OfO5LNej1bd6Cw3w25ivLjj
         LJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mu6yG40PFElfELrlUJu7B4Kuwli03YxaJZluXdbUq0g=;
        fh=fnVBknpm8Mf6OYHR9AQlmjd+7N0/UmNs6l3qvDuf1LM=;
        b=r37s+88I4l6K1OGIUJAglR7HPw/v6ZnHAXSNutbNmeAly9hBk+w9uhh5cw7qFa6BLj
         aE0tOXsfnYKnF4vEJMJ97av+E0fpJjYswl+qIxXceGETST6O4ExdX8+V8wnL9DLHnoVa
         3WoX/UaHislS2+YvNkzYzzb5zenHnklNkZSFylijAHtK2ZgNC0k9rwRZASv7VFVMNaky
         9KLVKLjl+qMY1xrBm57t2a0f5Ag5w3PZHT/Eb6Gx51LmHDa8g1vT3KdevuUkXIaWWCHO
         ntk+5PgkpbUsGNI1hvYczCvUC3+nllIHYWzv32nE7CkX7t0oTGRF683+4VloELDZqs3F
         0qRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cZo5zsmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05622a149400b004102b91f9edsi7804962qtx.418.2023.09.05.08.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 08:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cZo5zsmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdYGw-0007Ii-De; Tue, 05 Sep 2023 11:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qdYGl-0007B3-47
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 11:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qdYGj-00076M-21
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 11:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693928828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu6yG40PFElfELrlUJu7B4Kuwli03YxaJZluXdbUq0g=;
 b=cZo5zsmkdMJ/FmDTjZFk+nGRYFN9RW4jSD1R9HwvmdhgK7b6KgD9cEOM46fSFu4GlQkFnt
 Y2knVNURyj251iGULlVsg9hEqXrVLvTAHn4d7dkbmlkX5OLqU5O13arsUpg325rJ4fTdhG
 OSZb7QaaWm+w3G+Td9Gwlp1OQqodJIQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-JrOlfrnINmWb-eOv6Tfq1g-1; Tue, 05 Sep 2023 11:47:07 -0400
X-MC-Unique: JrOlfrnINmWb-eOv6Tfq1g-1
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-44eb8cfe7d1so163713137.0
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 08:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693928826; x=1694533626;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mu6yG40PFElfELrlUJu7B4Kuwli03YxaJZluXdbUq0g=;
 b=daG504xzisTNZbHxsCCNRySoXZzDZlsWeq54CaCJ39iqdkt4EkE8eWfbr1t4k5VwP4
 KRHf05+hxxA3mxdReD7NS6i1UkQmxCqAgfjg5lYjVVaiVC2RA5IQO9JxRr0LfcvRvfNG
 vQyHC/HN6VaF0NiSGptqRkKxipe9wxWRE6OS7fiiFL/T8ErqwoASApur/Rm4VUBUMzu9
 ROOzEMcIVyjYd8xg1dCPGVlhmlHuGYsmINdsW0+Rz6GNensxQXLPIxNtcw2EeWxfyD8P
 vvb6i/yD3hDdN3wbBj7aHtj+Hf6IwAx9FbHHxaB6q2ZOu7pgsPlZF598P/t/JHEQeV5j
 b2GQ==
X-Gm-Message-State: AOJu0YwoGHRrW0hZhDqKcHvNYULBmxX5TWAXORov9Y9LT7Xwpax8JHys
 7+JxDgVhczjotcrnoViU6eGyCRNuNTwLYQryYqtHTJB2sMEa8uiXqPyVoSx3lGaP/2b2xGQS9pf
 VjgtvkPgdviJ8
X-Received: by 2002:a67:fc48:0:b0:44d:4dd6:7969 with SMTP id
 p8-20020a67fc48000000b0044d4dd67969mr9394495vsq.0.1693928826759; 
 Tue, 05 Sep 2023 08:47:06 -0700 (PDT)
X-Received: by 2002:a67:fc48:0:b0:44d:4dd6:7969 with SMTP id
 p8-20020a67fc48000000b0044d4dd67969mr9394481vsq.0.1693928826526; 
 Tue, 05 Sep 2023 08:47:06 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 ml9-20020a056214584900b0063d316af55csm3509259qvb.3.2023.09.05.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 08:47:06 -0700 (PDT)
Date: Tue, 5 Sep 2023 11:46:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 21/22] softmmu/memory: Clean up local variable shadowing
Message-ID: <ZPdNc5cPI6N2+thi@x1n>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-22-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230904161235.84651-22-philmd@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: g0/C2gnLldXG

On Mon, Sep 04, 2023 at 06:12:33PM +0200, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>   softmmu/memory.c: In function ‘mtree_print_mr’:
>   softmmu/memory.c:3236:27: warning: declaration of ‘ml’ shadows a previous local [-Wshadow=compatible-local]
>    3236 |         MemoryRegionList *ml;
>         |                           ^~
>   softmmu/memory.c:3213:32: note: shadowed declaration is here
>    3213 |     MemoryRegionList *new_ml, *ml, *next_ml;
>         |                                ^~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

