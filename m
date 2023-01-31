Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1557840ejb;
        Tue, 31 Jan 2023 00:33:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8W9SfIOpWXYxBMoxtNYsZ+mLZYa/ejwEud3qWu1l6rno7ruAwgHSSgpL192wHLxL8b0Lfw
X-Received: by 2002:a17:907:7285:b0:84d:35e1:2781 with SMTP id dt5-20020a170907728500b0084d35e12781mr3026060ejc.46.1675154005538;
        Tue, 31 Jan 2023 00:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675154005; cv=none;
        d=google.com; s=arc-20160816;
        b=S1p2dEWL+bxDNSbuzROE+Cl4mWtU8V43OHxRVREyiySpEzJ4oy+4YmuM40sEgw6GI/
         G3V/XjJxoDgWpwLTdnidnfVfCGftUspON9ukVuiFKXg09sBqFZ1Qu1PO8mYEnETenvH2
         TqNrMvfWk5qDCfmT1so9UkdXwYXnXzLNJvALkFDPoUm8KFU56VdI6w1i/8i5XyxG1suq
         AJv9YJ9POYirBpSPQCaq9S36n43e37CuZ6yUKzEp3u3YSrHjSSMxvvcK7NrQiC5yOAtb
         580ScQMme0d7EYM+Qt4h0Y9///J6JasA/bjuu1l9S3RXtQfKRjP8yhnbJezWbIy18KQS
         fj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/ZzzXnxJEUhn1s6JzrmNCMDRn/vHMwKPIB2mhIMVEtg=;
        b=N7Nd6i6+6FqWGJA8gf/mVraomp3Wdvn+TU31wOaMrK4WEv3vhNz3Nxsvh/Z+IKSje6
         tr4zuOUP+FoZ2SWcjc23GFqR+XsI4Z0dc38lkbMO4P8Bg/2Atlgy9cF5Yr2QpdCpXU4B
         u+Jh/ThsOrJ6rClYeLnCvd3iQVkfjDdyZHYJ8z8XRWnI3Bt1RpjnkPDfOazMqpwhK/Bs
         +1zBB53253VyfhbpbMp/N2F9puSCaVxadcaF19BafzVY9W4kMvAYcaYhaa+5SNFbXrFn
         lGzbAmfSegjz/FaLmtk0bN0Miy9KPRSq5VLsvlblgoBqxz6d09UPYJH27mnJy5bE4eCG
         b6RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=UNWvpsrE;
       spf=pass (google.com: domain of vsementsov@yandex-team.ru designates 2a02:6b8:c03:500:1:45:d181:df01 as permitted sender) smtp.mailfrom=vsementsov@yandex-team.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Return-Path: <vsementsov@yandex-team.ru>
Received: from forwardcorp1c.mail.yandex.net (forwardcorp1c.mail.yandex.net. [2a02:6b8:c03:500:1:45:d181:df01])
        by mx.google.com with ESMTPS id 20-20020a17090600d400b00870b95fb7c4si2737927eji.998.2023.01.31.00.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 00:33:25 -0800 (PST)
Received-SPF: pass (google.com: domain of vsementsov@yandex-team.ru designates 2a02:6b8:c03:500:1:45:d181:df01 as permitted sender) client-ip=2a02:6b8:c03:500:1:45:d181:df01;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=UNWvpsrE;
       spf=pass (google.com: domain of vsementsov@yandex-team.ru designates 2a02:6b8:c03:500:1:45:d181:df01 as permitted sender) smtp.mailfrom=vsementsov@yandex-team.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Received: from myt6-23a5e62c0090.qloud-c.yandex.net (myt6-23a5e62c0090.qloud-c.yandex.net [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
	by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id CACF45E7B0;
	Tue, 31 Jan 2023 11:33:24 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b42f::1:11] (unknown [2a02:6b8:b081:b42f::1:11])
	by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id MXQcqC0QYiE1-xQNVObYN;
	Tue, 31 Jan 2023 11:33:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1675154003; bh=/ZzzXnxJEUhn1s6JzrmNCMDRn/vHMwKPIB2mhIMVEtg=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=UNWvpsrE/NP5qGkRgDHvkICtiAG4GotoGADlg4qZgB1KUoXTKpQBLxJYZlpHXOZvL
	 SfZqo1MfuoDmqNsUmsfE55g/WgnmbQdBsDO5I3oZ8/V2oVCRIP6WDf2XFWgRNwUTN6
	 bCXU6jO6JIEVahr3oVJOAqXPXuUQbigONyMI7yFQ=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <f37db85a-b0aa-b34a-7d5a-b1ab650f1683@yandex-team.ru>
Date: Tue, 31 Jan 2023 11:33:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] migration: Remove res_compatible parameter
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Klaus Jensen <its@irrelevant.dk>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Laurent Vivier <laurent@vivier.eu>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <huth@tuxfamily.org>,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 virtio-fs@redhat.com
References: <20230130080608.2100-1-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230130080608.2100-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7iuIcN2MiF8n

On 1/30/23 11:06, Juan Quintela wrote:
> It was only used for RAM, and in that case, it means that this amount
> of data was sent for memory.  Just delete the field in all callers.

Could you describe, why it's safe to change the behavior for RAM?

Also, I think it would be a lot better to split the change for RAM (s/res_compatible/res_postcopy) in one patch, and then drop the totally unused res_compatible file in the second patch


-- 
Best regards,
Vladimir
