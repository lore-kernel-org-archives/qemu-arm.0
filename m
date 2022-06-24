Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp159059lft;
        Fri, 24 Jun 2022 01:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXmXAqh3yjBVrdlE+KmmwEjv2VBdI3JvT+ZfnR5ss9HxCLeXhtOm35noNmlwQDKtUiOjSH
X-Received: by 2002:a17:907:9805:b0:710:858f:ae0d with SMTP id ji5-20020a170907980500b00710858fae0dmr11910011ejc.360.1656060913435;
        Fri, 24 Jun 2022 01:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656060913; cv=none;
        d=google.com; s=arc-20160816;
        b=DLcdRecDEy4YhxEQUNByhqBSoiuAKomMc0L5AUvrTvABvSpb2sVXta3dnduqk8FyeZ
         MlKobzyRos1Vx21Ggz6MYB8SCF11rWOVk3pVsDOvfvgSmsRGmql/GwYPxmO0UJ9zLsG2
         6Sjj/BHK6ZgZKkUTVjIKBFQxKV9aHN+X/gTDfm6DjhAoIPMeVqJMTCEzgme47zwYusrp
         hixZa6lhzpQn2iCVWERJWTM6ad/6+8b2qZEP2MTuPr3/WsTPdud9JZ5/AfKx8mX4sy30
         FD03wl507r9KlnJ4aadtFr7Ur/H4X0EzFe/5TeIp6QAwfPE/iSKdRVoEedChGFQpDan7
         WboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=xtxvkcHH8loNZrJGbnYCsrmPvbmGvyeXwZLbpMlIQkXS6A2GyzK//4UkDDa8xFp0wF
         4O1o51/jG7tK32X/ChB1nk5yc2qSyOe2SWDPwvR+T1UWsXfDIoy0m5Pxpe4k/5QGkFXq
         pvyeXeNsfdZhIExEKWKXzCIZKwX8gy9evDNu0W4ez0rUI8Qn9jBvE0FbadESa+AMkhyd
         tCxvy+HFplp17hC9VQD7MNtnOk0CuxncPMuO+tOeThAujn1tAezGFhR0NTZAJYLAKIdg
         COm7gW5QwLc3nFsV2g45YBR8QXDzvsgXY9YLddJ7uvKU8MyEHWWWxsQi+oilzBRfDS0i
         h5qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=clZcKvLI;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ho34-20020a1709070ea200b006ff7867806fsi2349282ejc.783.2022.06.24.01.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jun 2022 01:55:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=clZcKvLI;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656060912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=clZcKvLIlaSI0aj01C5lBcQXLk+ikl+B/lRxtrhuDg5wwkqdYF5UPGMlnYSf0lpgXhCWYT
	gls4LxDtou6pAKKKlV+4NFGPA7Of0TZclZCdFuJWDN30JduJvike14IeynA/GPT59zCXzZ
	nLJPAC8DViQwIpulrZlJ8I7gTkkG5jQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-8kQPj_gwPha5AfRxe-hGEg-1; Fri, 24 Jun 2022 04:55:08 -0400
X-MC-Unique: 8kQPj_gwPha5AfRxe-hGEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6A61C06915;
	Fri, 24 Jun 2022 08:55:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3893C53360;
	Fri, 24 Jun 2022 08:55:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	thuth@redhat.com,
	alexandru.elisei@arm.com,
	alex.bennee@linaro.org,
	andre.przywara@arm.com,
	nikos.nikoleris@arm.com,
	ricarkol@google.com,
	seanjc@google.com,
	maz@kernel.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
Date: Fri, 24 Jun 2022 04:55:06 -0400
Message-Id: <20220624085506.2731362-1-pbonzini@redhat.com>
In-Reply-To: <20220623131017.670589-1-drjones@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-TUID: cwXREsZ3/P2T

Queued, thanks.

Paolo

