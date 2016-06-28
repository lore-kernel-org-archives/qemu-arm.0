Received: by 10.25.21.96 with SMTP id l93csp1503050lfi;
        Tue, 28 Jun 2016 01:03:17 -0700 (PDT)
X-Received: by 10.55.24.215 with SMTP id 84mr2459550qky.51.1467100997016;
        Tue, 28 Jun 2016 01:03:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si21514082qta.70.2016.06.28.01.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHnzI-0007yX-G2
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:03:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bHnzF-0007w1-IX
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bHnzB-00063M-Dd
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:03:12 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bHnzB-00063G-7M; Tue, 28 Jun 2016 04:03:09 -0400
Received: by mail-wm0-x243.google.com with SMTP id c82so3614848wme.3;
	Tue, 28 Jun 2016 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7Lu6dTMnxpE+CYRsFzfwZ6JugRC0ZB3uq9KL02suXKQ=;
	b=osevfAWrlspLAeK3pKBB8VCSDs8auFbRqWFiX+MLsJI/mrmQ8neRSLbNd04rm8xYZL
	8+NBjwq9Fhh5+QOvY8WzNzzaJyFFqBuUVVZKzElktHwcZipA5pkG3bh4lR3regItheK6
	hZuyB4uG8cBpm64zEWgrDQMcwVEiGPE1HOZ2H+pirvWXgbhup0hIYNFbXpXQf/PdJ5Qy
	607XcnCEkh0c7hGVoP0EO35Hsvis4Tng1GYr4Eac2F3806LB42qo2hdREAFnIVTOUAns
	61FbHYkoy0CbqlTaoPMfpnmyQuEo1TIMYHJqzjVbpkVusnOxThnI+cHd5znioj5MFn2y
	Z2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7Lu6dTMnxpE+CYRsFzfwZ6JugRC0ZB3uq9KL02suXKQ=;
	b=ZLQxUzkNzmjNXOTswEftQ5cO2Hj0yalXR6qahj7VLkhMTQbrc9yF9GtPk1MjeAjJkm
	ETBsdC9GUD+pCrXqKUlkctTHGVW+rHD5qnAt2WYqYypp+hR+VU6n4alg8Mh39eEEuzjj
	qpOQOGM6XzGMu8boCRCer00neCYzr/2YAh2NdtVXy+esl7gB5VVKEKjwB+TKxwQy7hKP
	R/pM7XNJslVYohAJbUSWCCDzV7Bg8tM0JwMPJcNzwtGiPOFxHm9vGnpjeWS+7r6t8BYI
	fl5NcDF5BBec2ADP9OKG56dDUw8pVnLKgmn/iTMhahAa3qYVrCa2BqwJeVOAgX/o62H7
	HNlg==
X-Gm-Message-State: ALyK8tKSX0yGUdvOCSc/8sTZ9zd6/Q1IUa/EoKGReihr6CkGOWOfIFHSJ80iQCyeU5mxfA==
X-Received: by 10.194.248.230 with SMTP id yp6mr1609423wjc.144.1467100988481; 
	Tue, 28 Jun 2016 01:03:08 -0700 (PDT)
Received: from [192.168.10.150] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	w81sm1935852wmg.20.2016.06.28.01.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jun 2016 01:03:07 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cfcd090c-bf43-4bfd-a8dd-c871e483c21b@redhat.com>
Date: Tue, 28 Jun 2016 10:03:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1467045813-18144-6-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH v4 5/5] tests: add a m25p80 test
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6uFao/l43Lg9



On 27/06/2016 18:43, Cédric Le Goater wrote:
> +    args = g_strdup_printf("-M 256 -machine palmetto-bmc "

Also you want "-m 256".  This is not failing because the "256" machine
type is overwritten by "palmetto-bmc".

Paolo

> +                           "-drive file=%s,format=raw,if=mtd",
> +                           tmp_path);
> +    qtest_start(args);
> +
