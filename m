Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp284603wrq;
        Thu, 21 Jun 2018 18:44:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJZVVzJQn7Ox3jrZhNyOh+qaa/NeM4Kyca73NARk57AlKHbukni0be4TTmQwEgo5koYnxQx
X-Received: by 2002:a0c:a916:: with SMTP id y22-v6mr24965553qva.179.1529631891055;
        Thu, 21 Jun 2018 18:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529631891; cv=none;
        d=google.com; s=arc-20160816;
        b=sFHIN+vJ44RgKZbbefyTTw23mLQhIVfomaK77DPvSMplloAkNVHVMqPoIOPzVnunYl
         lA1KivsdcFjvTF3D502CgSlz3+Sq331iloxxP0EEyC+Xgd2OJWB3XrKihlkTVexcsKko
         bqCNlgh8kEyAe39yAmiykJTEDXXRsdOlsNd9PGwvg+brE8l90tMY7yoszCPH2ba5fX9V
         KRg6d2a9ehLLDtXDfUMz6k65IlaHeYcotdbMwF61xX1gYVNWHvpygO98nP549L3yk7bF
         d4r9C0WHrNYX26lrY9d3hqiVduwjxo/dToYqH/1mKck1xj3h4C9Kn516BRZzGWUVoOQY
         BwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :from:to:dkim-signature:arc-authentication-results;
        bh=kA4QJQELRUWyzhQ59uaYIHjs1FjyPjmd1/Hqy5e8Agw=;
        b=C1ywNMQpdxdS8ATM+vRlV9UBFZvtgjmP+falGY5+EUAiMNNGIUyXfgXBlhh/T/GMys
         urK84xkW+PXYefWb+ktGBIfnx0IozN2FL3t2oioPPbyJauVjAvL68Vd7wEormBlJin5s
         fKQ6pi41eGXQ6JAGa/p31apCHX2laO1GcZb/riOBmfWTdQQRbF5nmOkCB89h9pS+x8Jt
         Bh4bHT6NNDjiD3auw+L2XwA4slNrkG26+EISstbaTh/6WhXtIzugvvidDxBo6r+itQzz
         PNGVdW42hHPMgpsoYq2RC2/YUNuvUmI0ZMLGeklce+Gjk9iP+ylw7qqlkDggyld2eDad
         7wzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nwAIZF+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l67-v6si6539311qkh.317.2018.06.21.18.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 18:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nwAIZF+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWB86-0004wc-HV
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 21:44:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fWB7z-0004wS-EW
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 21:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fWB7w-0002fz-BM
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 21:44:43 -0400
Received: from mail-pl0-x234.google.com ([2607:f8b0:400e:c01::234]:33199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1fWB7w-0002fn-3w; Thu, 21 Jun 2018 21:44:40 -0400
Received: by mail-pl0-x234.google.com with SMTP id 6-v6so2635322plb.0;
	Thu, 21 Jun 2018 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=kA4QJQELRUWyzhQ59uaYIHjs1FjyPjmd1/Hqy5e8Agw=;
	b=nwAIZF+gdV2QDlVr9D/WymQ6iWgJ+d304tA6AG4zff3AC1pTY32rZ6FfCS+eaO6gpK
	H43YAFBgi3KNNMw5pLmlxaBW78EyaNfccyGd3jte3pLDqEZypUMgDXqnjyGbpCdN8pxC
	w5SgUf+OW6c/skNhYeT2aYgnKj1wGEVU7oey4SS8xNuR+N/tZvwLeYq3o3cAhHhPCodD
	sV3lc99GZ13a+RZfTg3MBNFzdX1uhZgX3ox1NigTm0EgQiBEjPbWNV9fCRIHffWmpmth
	8lsUCGLIjUSHyQY1Da0d6HTykWAhJ2ISHpamYyV5uzy0VFRnhErUFVyuk+uhsY6CSejC
	TSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=kA4QJQELRUWyzhQ59uaYIHjs1FjyPjmd1/Hqy5e8Agw=;
	b=d5awSmJGpWuca1T1N28UsuSl4b4W6WM3snlqWTcfX+jo03GMRY32ZCOSQJojVe7b3F
	lohdp7qRaqelzSGA4HR1y7nKHK6jZIqXnCQcJz1zArTcrofgbwVuxBtbKo+h22T7qXJF
	s6AnJIw4Nt6RMupeapOOIKRN2LMmECJhhVV7Dr7M9H0mWoLlftLWoFaZtsoG/PNS6a57
	HGw9Uo1m63gxR/BuLIlmjsmO1j2Qzp8RxSs3qNuOvfisJJpk66ZZBzRdk4ZagMEfylcg
	mLwETM0etITrdizO+Q0+x8883vi7lttyxkdoryrirn6GxotH+AaYRPXEK6CFQybB6wrB
	2Dwg==
X-Gm-Message-State: APt69E3cWJkobQbJwv0uXMw/mepHps1wwfU2BbHGjXd8jCP7SyBQlcTo
	scZs2NUF5171oO/Dui5fE1XIED8R
X-Received: by 2002:a17:902:b7c8:: with SMTP id
	v8-v6mr3577123plz.188.1529631878553; 
	Thu, 21 Jun 2018 18:44:38 -0700 (PDT)
Received: from [0.0.0.0] (67.216.217.169.16clouds.com. [67.216.217.169])
	by smtp.gmail.com with ESMTPSA id
	v27-v6sm11366760pfi.23.2018.06.21.18.44.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 18:44:37 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>
From: Jia He <hejianet@gmail.com>
Message-ID: <d5f8be99-9602-a628-bc43-486e7befc4dc@gmail.com>
Date: Fri, 22 Jun 2018 09:44:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::234
Subject: [Qemu-arm] [Questio] What the proper vfio NIC for emulation smmu?
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nM9gTMmj0uho

Hi Eric
I want to test your smmu emulation patchset with vfio-pci ethernet device.
Could you kindly give me the NIC type information.
In my test, there is vf probe error for menallox connect 4 NIC and TX Unit
hang error for Intel X540 NIC. That's the reason why I ask this question.

-- 
Cheers,
Jia
