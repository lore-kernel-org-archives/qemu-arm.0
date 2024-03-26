Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1348585ejj;
        Tue, 26 Mar 2024 06:37:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsmDDZwG1zO5dMrorguWgJgyzjUqQpWAfgM/YXYveZ+u+a23rac2q0/UaPz05CRbhlWPWK/bCTZle3NGJBUKStJNNalscU
X-Google-Smtp-Source: AGHT+IGoYEgs/Xbw8fhNx3y4pgdOf6OnkHLm2300dwBbFVLdVjSSWxLjglKDrAmnhspYXJbbtU4E
X-Received: by 2002:ac8:7d11:0:b0:431:5aaa:649b with SMTP id g17-20020ac87d11000000b004315aaa649bmr5532123qtb.3.1711460248178;
        Tue, 26 Mar 2024 06:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711460248; cv=none;
        d=google.com; s=arc-20160816;
        b=w7aiocAZoZ5DXNgW0ksxumPqUDFAm8YruCjMjIwrKY8IrvpH9oMpnF0LcRo21LijZq
         sDP5KboS6TdOYU6+j+zySkCM9nC0/wzvCaJuSgNSq81Ch5lK7FKfyr81K0c0HdoCR3eN
         9+MfEY7VYuHJGeZkWEYLxCXH9QCGKLqJ8wP+oAvbLwTpRg+BZEF0C53qJ+IskyZHbIck
         +ZN7v6hnGQ0CPdTDZUZfZK/7kpvY9KsKjScmlwmM7SNH4JcsbseXJ9oPok4X47R/z/L3
         Dstc2VJDBTP1/UysBgBiqh0ba9RVwxdLW2ZIPc3nw3dpGwUBVhXemjEAi2pYtF55zASV
         EWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=9IslcTcT5W/4mVhuyx1fhMDVdiwOSpv2X5AhvRFmRFw=;
        fh=5zeJpO4ynDVAtSXeA67ToqlohQB1e8PC1m+coNyDlrM=;
        b=tVsEt0zTWJgWpGYygdYuhrKrlY3Yq8haGO3zRSqZN03aQd0fI/N+iJRqj8REOUglDf
         V50I/TrfuHRj0Dw6BhUk96jUqdbdcZkSO+lDqIluPDkYgludsPxNoMJp/TrAChLT+RX6
         pTL8EYp9exN5yGTXbkTl5DogDlIppvSHk0J7mtzuNv4sgAKu28okg1eDM17ZFgfzYSJV
         FnZkza0aZZa/cpuPml56tXswwFVGr/k9xMr1lGGqScrRQhlOZRP5ejYBW4itY1N/TEAk
         FBG3htiAfA8rhk6xsI36eISRJrqMUdmpxWwl8seX+Ld9TBphjzku9Gqs7m198Pd5qPQG
         9E7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JNHwK7ki;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ev4-20020a05622a510400b0042eeda8adafsi640525qtb.561.2024.03.26.06.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 06:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JNHwK7ki;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711460247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9IslcTcT5W/4mVhuyx1fhMDVdiwOSpv2X5AhvRFmRFw=;
	b=JNHwK7kigootaFqMrfTuwuTpBzNzqWMuSETTjIiCI6e+E5NJUwj4sKEvLJ0yQZ+anAbm5O
	x9eDA7IwDNerNoVG/ERzc/nMQbHkosV18jpmXvEu+PbqYmqmAPh4dCw9C9JeaZF9K7p3jD
	G7FGlP6lkydVlUuvMMs/Vhd1ffQeBtM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-KumXqmMRMj6OBPCPqQYJeA-1; Tue, 26 Mar 2024 09:37:24 -0400
X-MC-Unique: KumXqmMRMj6OBPCPqQYJeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66F088FA104;
	Tue, 26 Mar 2024 13:37:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B78140C6CB3;
	Tue, 26 Mar 2024 13:37:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3199D21E6757; Tue, 26 Mar 2024 14:37:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Anton Johansson
 <anjo@rev.ng>,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Claudio Fontana
 <cfontana@suse.de>,  Richard Henderson <richard.henderson@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Zhao Liu <zhao1.liu@intel.com>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.1 00/21] qapi: Make @query-cpu-definitions
 command target-agnostic
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Mar 2024 14:08:48
 +0100")
References: <20240315130910.15750-1-philmd@linaro.org>
Date: Tue, 26 Mar 2024 14:37:02 +0100
Message-ID: <87edbxm7wh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: k2ERSdsaqNXv

The general approach looks sane enough to me.
