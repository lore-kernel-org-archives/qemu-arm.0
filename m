Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp316521wrm;
        Tue, 8 Oct 2019 18:29:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4SqB2kStfk+4IFnhmLJYjNtok0vdjDvMo2ax3+aAW9O219b9E+9tPC+UwHL9xal4hLVPu
X-Received: by 2002:a92:dd88:: with SMTP id g8mr743379iln.221.1570584549632;
        Tue, 08 Oct 2019 18:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570584549; cv=none;
        d=google.com; s=arc-20160816;
        b=Ou/ITaN0pCotzUsBWAXBRl6SsMDe2DT/0FPjHBgZ/zKkVbymw6Oli9B4bUQUMEqZRq
         VAhKFueY1ZuhCl/Nf6ND2ejc5QcLnors27bxrOYX7LSnI8QtQl3avL9qMuOtOvBSoXxb
         Oy6ihTIqjuZRPJPVloJIUKUVw9t/48YGoJQ3iJC4RIaVW7RKPErOhfXgi6YUBDW8HrQe
         hoBGhJxcQD85dnunA0zBch8TBMhNKFBjkPZLJDnOTfAD7QU/Kbd8NC8OjkluJj0gVq+Z
         5Wp7UvYUcriSfjzvCduPntNM5MtAv9sKxTZ0nMw5ohbZBOfnweit7Kkyb5vPL9X91Fu4
         AKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=WwOpnbrDTKDpQrMCTYga96XQN5Xcdvl1kaYwvT1rUaQ=;
        b=tQpRUGfGtloCnQxtUlCHzU7jmcZBYRODk83qtYoRUeSy0J4xWhmFDDa9vCUlHRLYRF
         dqIjyStzPsUBqwVEfWDKzhvw3rbKWPZr01QRxkPsuXqORnFVMW6T9s3s35kWJ2KWY1Q7
         u9btBZReO2NgL1s6d/QTj4P1Lfx/87wA1rUohkQfFA24swLgbaAcSce2qzx6BnAQONfP
         8WYugro+KuAsdzgsg+0UiE8Dkx0ZZZ+gLwStG/4WhjY9NXROgj9LKfSh7SpUjgXA1liI
         oy02PbXOFvbhktKXeTsjQ4dQZGgZcWpD4cSFlvCnb4mbMeqSKoTc+nHTEDFAdrc3wljw
         zadg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l123si1040892iof.38.2019.10.08.18.29.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 18:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 830CB83F4C;
	Wed,  9 Oct 2019 01:29:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com [10.10.122.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBF6260167;
	Wed,  9 Oct 2019 01:28:59 +0000 (UTC)
Date: Tue, 8 Oct 2019 21:28:57 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
	Laurent Bonnans <laurent.bonnans@here.com>,
	Esteban Bosse <estebanbosse@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Cheng Xiang <ext-cheng.xiang@here.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 02/19] hw/arm/bcm2835_peripherals: Improve logging
Message-ID: <20191009012857.GA22824@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-3-f4bug@amsat.org>
 <874l0jk3w6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874l0jk3w6.fsf@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 09 Oct 2019 01:29:08 +0000 (UTC)
X-TUID: g7o2UmmXVEoO

On Tue, Oct 08, 2019 at 10:00:57AM +0100, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
> > Various logging improvements as once:
> > - Use 0x prefix for hex numbers
> 
> You can use "%#"PRIxNN"" as an alternative I believe but anyway:
>

Unless the value given to the formatting string is zero, then the "0x"
prefix is not applied to the resulting string.

> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
