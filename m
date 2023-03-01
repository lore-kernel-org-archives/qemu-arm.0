Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6712787ejc;
        Wed, 1 Mar 2023 01:08:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8q/vm110MLApUBVqd0N0pPTDa7SCwz1PBY2bCNiwcM2eFPFIaW9LrKOSuwDfnlz5YBPr4H
X-Received: by 2002:ac8:5dd1:0:b0:3bf:daae:7ee3 with SMTP id e17-20020ac85dd1000000b003bfdaae7ee3mr9947225qtx.53.1677661728702;
        Wed, 01 Mar 2023 01:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677661728; cv=none;
        d=google.com; s=arc-20160816;
        b=Luhjdyn+R/6kG4I7WHj3fRkGvwK3VXJvOv6dNN02EmgwrTZj2dzNp1awmxRySzyupf
         n2NgTUvgEBoQtc5P1/cryYklgscpHAUC39jaXXU2iEUtZ2XwOuk0GfA+9S3CKZHr23zl
         rZhbMeEAHbQ99spsybRzVxz5VWXfAIeNuAEA1KNnHf23mQYOvT7wZfKunBpEbRdJSxXe
         KsKajeaC7JKucZxEV2aBMaugGAi2IoT9IQrinN341YtX1VBPWIds0dllG69NBzWPMqja
         2QjGVBf39Skk/1wykIY8hQSzyQ8d2wPYh7KmgC4Uq9BHRHltudsDq6b36lNgoBETRnGg
         OnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=lPzlzuhZo7jbP4j/6AirVJDAHwfGqwks6gPz80Ytb3c=;
        b=H/eXwLVqsRXH4vc5+zxyCvbpjOSQao3K35l2G1NiXAYqMgZi0VE58ThV1uu4IAAvoh
         NDR+sdDppoq1QDEkGr5Exr1XPGxvC+/8BFamc93gfK11O4SXsk9UK0dnTQR9gObL5+mu
         KMyuqtH/qeCBnLgNBWISadn1uqvq9bPn0KMdBPxa6cQRXkSDvlfSES55TLMr4hCmIK4J
         15GWB9zFBfGNwpmObb23pR/ljCoToKyRqGELhAGTEqtWqEHxzvgNXObsl6ZygdRU/jw6
         a8p04Ble5La3lNLk8sprJ7+9/q9G8Wh5PwrAT3A/6cOWVmFJa/m5vBA80KNniH4Dl/Tq
         V3oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f8TVA//b";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c7-20020ac87dc7000000b003bd15ffddfbsi10351676qte.214.2023.03.01.01.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 01:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f8TVA//b";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677661728;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPzlzuhZo7jbP4j/6AirVJDAHwfGqwks6gPz80Ytb3c=;
	b=f8TVA//b4QANNq/9lKJt2n2Ip4+6wFh0FkNze5xkYYd9HiMYMndsgCtMsQW9u/YO+Z9By2
	8xkM1mXCJAUdJ3e8ZuKMlZrrqi8YfQv9IXI1vBrjfaQI9Vce8RR1w9So44JnqNK0jyZpjh
	/DVIocqE35BygG78/8ndIr8gWNZSbuY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-_AYkG7GBNFybBNFvkp4hHQ-1; Wed, 01 Mar 2023 04:08:47 -0500
X-MC-Unique: _AYkG7GBNFybBNFvkp4hHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E52A800B23;
	Wed,  1 Mar 2023 09:08:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1A42166B2A;
	Wed,  1 Mar 2023 09:08:39 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:08:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 18/24] tests/lcitool: append user setting stanza to
 dockerfiles
Message-ID: <Y/8WFQhfnFkLjTT8@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-19-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228190653.1602033-19-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: Fn0dxuVfUlPp

On Tue, Feb 28, 2023 at 07:06:47PM +0000, Alex Bennée wrote:
> For the cross-compilation use-case it is important to add the host
> user to the dockerfile so we can map them to the docker environment
> when cross-building files.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
