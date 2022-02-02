Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1040523lfk;
        Wed, 2 Feb 2022 02:28:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo1iOhIv1VA1Yk2N6m5vXzGZXoSlNlnnSS8d1bvG9nMUeq6DPFF2orkpCv2PfbbQWWjZT3
X-Received: by 2002:aa7:d312:: with SMTP id p18mr28765374edq.49.1643797717587;
        Wed, 02 Feb 2022 02:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643797717; cv=none;
        d=google.com; s=arc-20160816;
        b=yJyKTPIyDMGNSV5E+Hq9ZLb88YxE6lT7uopcxKo5x3mvbDgO89dHQ1ym1FbzD+svoD
         Vw+VRh2v5UQ/vWMHRbd83bj7EkFEb9Dr0etYAWeyle8CtSpTYkyxUF3pyQgN09Y5e/k4
         skETQVq0xn1c/ATjj/o0OdpCySuWmNXLpge34EbHay2Gsz1IPgYscZ/G4Cz7UbfwIQz8
         jWjB5k7Jw1DbNw2wI2UmT7Lv4y253o/QCpNhVx/Ze7s6IrkuxHE/POzjub08i0ADg2a8
         m7UabShqj6PvEDGIuyrkUKkWckL2WtYT+8Adpmaa7fGETCk8qty3dCVFLSgSGeUcnkdJ
         Sa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=txBz586yMEc/UeL7VfgrrVEPuCoLkUSjRn73MgpTE6Y=;
        b=DbCoeOC0das0+rEUScaRYbNkmslmOnVq7uFcpGFZu2G8ZV/T5HUFA/IpW1z8iCLDl3
         1N/VrbYipZi7Cm0UZJOAvNknzsN6oTInREz5IRytN//3BL7z+iV3te/8Mk0JbKWaFQ8i
         Qyd5w1StYc9GqYa9wQE3sGW+7jwJBgCKdsUjDkpA2xDoHy+IySA9eEv3MWGwzercpPPb
         ArdCzi7jntcjCojBtpC/g3bLnwNjnx+piX962KAfe12kDEBGfiB2rXJ6bZ/N+VfGuSe2
         rREBIWgtnHEk5aGum8KcaGlJBamljUZtOgJzEGa/iYR1bDDGBkHjBNogBvz9c9PdNQj/
         IXsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8uWZ7B1;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hs24si12099842ejc.295.2022.02.02.02.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Feb 2022 02:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8uWZ7B1;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643797716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=txBz586yMEc/UeL7VfgrrVEPuCoLkUSjRn73MgpTE6Y=;
	b=U8uWZ7B1KerLSeQl9P1xY5QFHvxpNQ50mRpNCtXic/cA7G5qZrf4XMSFa1Oz5Qikc4y2V5
	Rqc+DtrFlxIv6JHoaa+9eLBhrT69dDS4nhryFxxp/OiQENn4phP4K+FHhyY6bwBah5foPb
	i0+ArTTLX5CN6lOr99YCyaoM27JvCJU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-z6d_He8CMTeBDIXvLMKizA-1; Wed, 02 Feb 2022 05:28:35 -0500
X-MC-Unique: z6d_He8CMTeBDIXvLMKizA-1
Received: by mail-wr1-f72.google.com with SMTP id x4-20020adfbb44000000b001d83e815683so6663153wrg.8
        for <alex.bennee@linaro.org>; Wed, 02 Feb 2022 02:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=txBz586yMEc/UeL7VfgrrVEPuCoLkUSjRn73MgpTE6Y=;
        b=7Ia25eWDTonjb1fNp7ZLeAtL5TUt7voMSrz12Q8p275gdj3O0pLhKJ3abSDAJbMABL
         BWJ3OzUXGU8PtcosZ6xWGsZGQglysDo1yMhU/kE4LgCLIZ8G/EC0Mwh/O1Cm7bEL0UUg
         DngQzVM1v2Xa8nu1v3ScjMfA8Horo/4/a0N+ESd04Gea0/LOmVpKjvAkxSMAwr+ZcMYo
         elQJ093dWHSYObwO0Jwwxqv5sZM5bGlR/IXepdhJmNZbTNP3kiaAhU2/OCEVrSBJhG9K
         /o5XBTHRHhZQw18bta8aLFNnGeFN3VpabjuRhymmAd/0OQ6BP9YkgOtYMPPLx21K4v1A
         qSmw==
X-Gm-Message-State: AOAM531JQC5KsTMJn+yMFSJgpdbW6R41wduVbvdhULFUr4apQCje+LzQ
	bIjsbS6x+7V7tmJ73S779+A6qI9J8ib28i2FIT8oE7TxS45JAmIvzCXZaIcjtqXN0SIMJQcbZtp
	cuEj+/RF5wkigco/i
X-Received: by 2002:a5d:6c64:: with SMTP id r4mr25069039wrz.659.1643797714384;
        Wed, 02 Feb 2022 02:28:34 -0800 (PST)
X-Received: by 2002:a5d:6c64:: with SMTP id r4mr25069027wrz.659.1643797714223;
        Wed, 02 Feb 2022 02:28:34 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id l10sm16789040wrz.20.2022.02.02.02.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 02:28:33 -0800 (PST)
Date: Wed, 2 Feb 2022 11:28:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org, ricarkol@google.com
Subject: arm: singlestep bug
Message-ID: <20220202102832.lwiyc5huddau4i6a@gator>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: UwrC51bOU7oJ

Hello TCG developers,

We have new debug test cases in kvm-unit-tests thanks to Ricardo Koller.
The singlestep test cases are failing with TCG. Enabling TCG debug outputs
the error

  TCG hflags mismatch (current:(0x000004a1,0x0000000000004000) rebuilt:(0x000004a3,0x0000000000004000)

I noticed that the test passed on an older QEMU, so I bisected it and
found commit e979972a6a17 ("target/arm: Rely on hflags correct in
cpu_get_tb_cpu_state"), which unfortunately doesn't tell us anything
that the above error message didn't say already (apparently we can't
currently depend on hflags being correct wrt singlestep at this point).

Thanks,
drew
