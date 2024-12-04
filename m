Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp440255njb;
        Wed, 4 Dec 2024 11:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSLp+0dE7LqFAfe6MGsG+zIrL6qogn4x0uEHhOZcbRmCV8DaaUNmoEGhdTxJg5WUfNUTiQ4Wtk0XZD3Q==@linaro.org
X-Received: by 2002:a05:600c:3550:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-434d0a15047mr76255495e9.30.1733339233547;
        Wed, 04 Dec 2024 11:07:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733339233; cv=none;
        d=google.com; s=arc-20240605;
        b=jqhrg1DbO26akVAhqlGRHlvROeL1AD+/QmZniML/az7aKa8w3rU7iOjiu1RS7ZbMTr
         eAeB/cjiiauQwsFgVukxb0C3dkAFCRY5TJ2cLXLCG4vAQ8sx/4NI9+Y8eOey9uqAjEY4
         9mwaq+86U/9XRlc2v6K43ShdQFtnjCEyxnuWoKpmvM5Rk98G8fzxPwwNdPE6qwRTBtE+
         UIg08rTbftduQfFZZ02Riq0PbJtOfzz+QvnJXJ13ytDYKbM9AzhtGsZh/d6NzFEM+c+l
         CPF44csOaihoPI8gtlFyyhnoGUslCnl5XtT6Dawr82B361G7k/nhohih1U4WghA5Bcq5
         z9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=s/uUSJl0KY8AFLs//UevlIhCcXiaJbGMsB4Vl+DIbJc=;
        fh=jGRaZu8O94CE1OMgCtj0RtRCug8GKxvNpdy1E/LMApQ=;
        b=KMIRcJWiEAUDxDmutWK6oLNDwCfr4D3ZrJ+gS96HyXyQWWHthvisLRV/xFffoHHKQo
         OzjrZOKgW3HaQMuz9rnjzJHYhKZH4EX1xmvCL52K6wM6tgVc9pwMt155zRjEwHyzdYDx
         WBfubfNgK8ZTTMnuRKzONJy5HCU3Xfd1AGsiXwjc5mu/wW3LAFMZrtk2hhcs9xcGUasL
         LN0zawgiOYl2GH/iQkG6a5rM3K1QJ2bY8Ozb2JhPPj0oIE/6BHbsYkOUJWjX+0vrh3xD
         qh9jzMx8u/JHDS8TfG+p10MKIVVUCyeIVBgwkHnDewwNyd+75WGrSrEoc0nugdaiA+20
         izcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSjHjXLY;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a2796sor58343495e9.12.2024.12.04.11.07.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 11:07:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSjHjXLY;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733339233; x=1733944033; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/uUSJl0KY8AFLs//UevlIhCcXiaJbGMsB4Vl+DIbJc=;
        b=KSjHjXLY689rub2mLgBHPKlT3NDkuXqHgpfTi8uap0r/GBi3P1rTrBI9yHXJZVY01B
         uFSzbm4uLxO6WBrkELYTeXNzsWu6sV/76MQWs6CHoC9oY5Edq6T48pRi6nHA87pUCU96
         AFMdf0mTHUSWMvT8QL3RtZLVX4xOz208JRCV6MRnK1X/oFbYlzHBqc1iniEi5EM+Co8B
         pPlXaShsTj6j0m1iH8JsdjQis7/tq/5ECWxKw/0LWI4XlaeLDlQeW8hn0XtJECV+AT+6
         NWxnZjLZIzmpl8TsWnizM9bGUPjvTUuKhgF4WdM0sJ+FAWvW58LSUom+xVAYlPMTZTJD
         MLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339233; x=1733944033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/uUSJl0KY8AFLs//UevlIhCcXiaJbGMsB4Vl+DIbJc=;
        b=isJ3AJoiChPSf2mp3r/d58rV9wncmczd8LW8EaHbzG+SzmcgE8jfs26qKXrXyCowUI
         KLULNh35Nrxvz/WS31lOHBUJvqSg0D2oO7sZRXbjt5u0AseKwGnYZNUTZlx48Gd72IJK
         ZzGdt5ZanFuH9G2yPzbsEa4Bh6wkFhmdg3jZxg430+jWSY4Xa+jqtR2Bn3omvjOAOUPq
         1pP9+Yh+Og3vLzuyPSP9w4t7RB1uYL0t2GYW5loGlmrbArO1tvPiqXQyrVeF4zYI1nbB
         cR2khaIWojCdjQvSmNg2cFDdVcgPjE114ddMOilyZssxUmDwrQZK7yd4HnnLPFUqwdjW
         TkYA==
X-Forwarded-Encrypted: i=1; AJvYcCUT6Ro6Fzz8URWycG53v+7OxusqrjzLePRzO99ljor96nUXRHA/jRn8X10nEPBdAzjW1ehF7lKQTIpxhw==@linaro.org
X-Gm-Message-State: AOJu0YwZQH2B/3dVTiPkqq+dN0h1XnGpg2dr8Ad76hanoYhXTeS75e60
	oD5sMCaIxQTedAA/MUy3meGlzPz+9mzCDf1X+SZRoZUD3dXGddJUhmMfyNsRRc2fcg==
X-Gm-Gg: ASbGncureC7LsZyDPL+XMTIV+V9DsQXKjIXwAxgoo9JJmOm8jQ8BXeKMHXg99yGuI5G
	A3cVySYedyrjPRyL0rnyOnzL2iAnPbNYedkBSh44KZqKZzDLQlTQww7jsrBA7lPPKrYZhjaWSTk
	GBplDEZUJTBCUD1dlTZrs5SVGN/mgnL0npXNGTqeLcClvnDNhlnt6OT4lc50SfKYcm2/vV2qFUK
	AM2Fcal3rEfFoPDz7g+/ZMEwxl10BQbsByxk+qG4UJIvjSw
X-Google-Smtp-Source: AGHT+IGSjo/OubjoeEuO6JIctiXQHdbhPQjT8nM+5lrqkZPG5u8xgrKE2CVQCrepNTIhQbp7+Sy7fg==
X-Received: by 2002:a5d:59a2:0:b0:385:df4e:366f with SMTP id ffacd0b85a97d-385fd42a71bmr5545868f8f.38.1733339233044;
        Wed, 04 Dec 2024 11:07:13 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e9c075e8sm12546939f8f.7.2024.12.04.11.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:07:12 -0800 (PST)
Date: Wed, 4 Dec 2024 19:07:36 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 02/26] target/arm: Add confidential guest support
Message-ID: <20241204190736.GB2349278@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-4-jean-philippe@linaro.org>
 <Z0XA7tNaD3iFZ8uM@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0XA7tNaD3iFZ8uM@redhat.com>
X-TUID: mGe3EYcP7tId

On Tue, Nov 26, 2024 at 12:37:02PM +0000, Daniel P. Berrangé wrote:
> When you create a new "user creatable" object, there should also be a
> corresponding addition to qapi/qom.json.
> 
> I believe you have the qom.json addition in a later patch, but it
> should actually be here 

Yes, I'll move it here

Thanks,
Jean
