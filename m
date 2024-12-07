Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1329805njb;
        Fri, 6 Dec 2024 22:18:03 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWPEQ86SO3LFD6Ri1sV1iFtZA87NidIRd1iI3c/uFumrJ3WSPR9c2Jx35zo7xpUlOXN9uWXYbXDtJNA0g==@linaro.org
X-Google-Smtp-Source: AGHT+IEx6RIQEN67yzOiuj1V/5YoW37mnuAKfRmi1BWo8gQKx0hNJnZF065tQTnwsEi10TyFt8kO
X-Received: by 2002:a05:6a20:734f:b0:1e0:dcc5:164d with SMTP id adf61e73a8af0-1e1870af513mr7950102637.8.1733552283615;
        Fri, 06 Dec 2024 22:18:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733552283; cv=pass;
        d=google.com; s=arc-20240605;
        b=lT/EjtW8qdDT+dw/8dVZsAqkYeSSBa63qOd7VwRiJGxyTY1Y/qTnSryUQys3whIPSV
         2ApQWD5XUWAXMH2yZkKbEoUzx6E6oLjuxoGr4NOgZ5gTVX8xBUf5AjjKXfJ0w5/O2ZOE
         VoyRU3PtDxXPwq12qJPAB1osw/+MtG3dyzj5HVxmJV08ucL18gAez76MOWAZ8U3NZlPo
         aqWPe/4XHHDbc2cqbB4Z/atB0cNd8t8njoMYSO6BOVCjlVMeMp5UMBKgyDU0+l8IgcAS
         IgX52m5FbfqBHAX52Aw5goe5bwuY+g8D5WVmmWElZ6giuz+JeJ2kGwFIKe4YwD6A+uhU
         0Uww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=aXd6sRb6hzxCMVHU9f1VtGB+1Mk/DPskD3I2aLsr55s=;
        fh=SzDX+6jCZfrspZfFdDDHeMYi2SlozwAVc5jCkvD88Ag=;
        b=Uxh7EvPDLzA7ydNjtc8prVSsWWAqFwmi1XWi/7N5+ZTDHjlAvW+WMGsNTJCZIN13N3
         2qD//i9OBiUSVDpj1Iwg/fxvtNEBqin5d8RnR89uUPNPoD71zFdDrtoe7yCR90qFKiTE
         a7nmZjqQqMhTiZR+yAMC3WBdN35rsj9l4GaoGfpxxfu56TMDJ41fkpVIbcJWhLVj5I1t
         BdX3qPYvV4O6ABVMzcmL/YYfCoisG8aNN3GKBQd9vqt52A19PWeboW8RgYaJQKy50Y7b
         pOtgjk6YLJqZVGok+HtL+bnhO65bgfk60WVzRBJ/fHvdMTfi6piJD3OypWCzBM1FwdwX
         x16g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daZEMNjS;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-435914-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435914-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-435914-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-725a2a0f5adsi5934342b3a.103.2024.12.06.22.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 22:18:03 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435914-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daZEMNjS;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-435914-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435914-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6E0280DE2
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 06:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD9381741;
	Sat,  7 Dec 2024 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="daZEMNjS"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D574A1C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733552280; cv=none; b=eL+CumWHK88kGtF+KKo3HFir8oH+9SG0NTx0Dtnz5z30YMQnIjvHA51yLZjb/k70V4IH47BKyae4JYJ9WIb1OOTx0NNmgh4HDUqKmOwAQ66fC9qnccgGOdtC8KshH80Iu/AYLUnInty5/HeqRS7aGcotO/ru/Hwesh024jXiA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733552280; c=relaxed/simple;
	bh=N30TJvXrzvaC1vfQH9ZEUNJj81IPJB/Abu4v/1Xw1YQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YzSJHl7qKjIH/LkcCKAqhmOeEExJz53Yen/yivrEmV6mATVZfCtXSpYk8441LF4C2S//reBHsbtHpB3aLckfGHGAB/7tyb7aIwYLcSuCi1V/nUV4bD8Jnyhc9332qDl2mlrbeJhhl0OjC/FSoU1nR9vX5DY2fXZT46HHk/GjzF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=daZEMNjS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733552277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aXd6sRb6hzxCMVHU9f1VtGB+1Mk/DPskD3I2aLsr55s=;
	b=daZEMNjSZPitniNtY2OFnDGbHGGu7I1j2qiuHgHhLLB8BYSX525oGIS+9yKGdev0j4JYfN
	bMwItURbaBDZQD4tTxNgPLxCKRgac5DlkeT5TOk38rnCyrVOf6EG5+kgIvKpo/nuamMN7Z
	6jnPtrNlOY4mvn3IRqhxbAFxVu8KH5k=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-0iHDL88oP52LvbRkV2HSgQ-1; Sat,
 07 Dec 2024 01:17:47 -0500
X-MC-Unique: 0iHDL88oP52LvbRkV2HSgQ-1
X-Mimecast-MFC-AGG-ID: 0iHDL88oP52LvbRkV2HSgQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F136419560A5;
	Sat,  7 Dec 2024 06:17:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.102])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82FDE1956095;
	Sat,  7 Dec 2024 06:17:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 39E4D21E66D2; Sat,  7 Dec 2024 07:17:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Shiju Jose <shiju.jose@huawei.com>,  Ani
 Sinha <anisinha@redhat.com>,  Dongjiu Geng <gengdongjiu1@gmail.com>,  Igor
 Mammedov <imammedo@redhat.com>,  linux-kernel@vger.kernel.org,
  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 31/31] FIXME: acpi/ghes: properly set data record size
In-Reply-To: <104add143d349685cea1b47298b8f5d367a3a15e.1733504943.git.mchehab+huawei@kernel.org>
	(Mauro Carvalho Chehab's message of "Fri, 6 Dec 2024 18:12:53 +0100")
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
	<104add143d349685cea1b47298b8f5d367a3a15e.1733504943.git.mchehab+huawei@kernel.org>
Date: Sat, 07 Dec 2024 07:17:42 +0100
Message-ID: <87o71o2f09.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: o+ad4t46c21M

Another subject line that suggests this isn't fully baked.  Respin to
reduce confusion?

