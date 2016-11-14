Received: by 10.25.150.194 with SMTP id y185csp1166454lfd;
        Mon, 14 Nov 2016 11:29:32 -0800 (PST)
X-Received: by 10.129.168.131 with SMTP id f125mr19096406ywh.215.1479151772888;
        Mon, 14 Nov 2016 11:29:32 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com. [2607:f8b0:4002:c09::242])
        by mx.google.com with ESMTPS id s90si5909138ybi.23.2016.11.14.11.29.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 11:29:32 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4002:c09::242 as permitted sender) client-ip=2607:f8b0:4002:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4002:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-yb0-x242.google.com with SMTP id v78so3133188ybe.0;
        Mon, 14 Nov 2016 11:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=FGmsX0tlyXD7itiZ1REMeG+2wR7Q0NO6OFvuHT0Xhw4=;
        b=AqEFgCbtGaY2Tczv8Ktr+3IbiQYIgmUGZNADOJHjcwvWFDovkdJhH6Cztq8+jMgUCW
         j0OzSX2rZP/gphF3gPfS/CW6g/oeTyj0snE6W8nlMl9E3dRiXM8XzGD/E82xbJ75/+1p
         1Me94rPVAjwU12C9PhQaW64vllDkiiRw97hTO7T2yaZzvmD2JjW709Bwywz4Z1w5KI9K
         DUZYX9zmxA7uEdVBO84XgTs68uTctzM/MYMVPdJLQGzBs8xOo/+SFNCbFySStGQTF1aw
         rT4uOXAFVNtaD6rW6kDUf8lqhWq7P7Ed2sZhHzruwoQtc/CVgb8u4XavEW2gpTflBDy3
         qWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=FGmsX0tlyXD7itiZ1REMeG+2wR7Q0NO6OFvuHT0Xhw4=;
        b=HzNmkAUNrnvLf+i0K+SHAqwhCGu9Iq1ZM0RY9pbORRk4OPNxEriRB5GAQq5wTouenQ
         2vdj5pD4olfXusDmBSJ0HgU4eK+t4YQidtURQeATmg2TgJIrcrlrO35ClOuK6IMoLZRY
         xM67O6AHhBM+f9SdDmmjgw3C5hzDeZvls6nUsZ7f9eHnGzsn1ZBRLQnMuXEnDL2EA66S
         9zTa4UONuFqmeB+42PpuDla3jvaA0myJ3ocVkv67rqrt6qM+PwFFCNWjcJxFBvAWLChl
         RRJnyXMQaf/tJc8cDjstq1QicEx9Dsf3bWNz8ouecFiuGhrAdsUHluCm16qrEb7VibpD
         6Ytw==
X-Gm-Message-State: ABUngvf3kmsHfL0qwUEsjHMlUPePHbgKvbjr2KAa805dhfsdqwI94eBR48QBnmiyrzgynA==
X-Received: by 10.37.36.16 with SMTP id k16mr5178974ybk.35.1479151772413;
        Mon, 14 Nov 2016 11:29:32 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (mf25636d0.tmodns.net. [208.54.86.242])
        by smtp.googlemail.com with ESMTPSA id q186sm8859421ywb.2.2016.11.14.11.29.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 11:29:31 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC 2/2] cputlb: drop flush_global flag from tlb_flush
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20161114174010.31040-1-alex.bennee@linaro.org>
 <20161114174010.31040-3-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Jia Liu <proljc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>, "open list:ARM" <qemu-arm@nongnu.org>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <29c02603-a869-573f-536b-4d05a0f3cafa@twiddle.net>
Date: Mon, 14 Nov 2016 20:28:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161114174010.31040-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OZ+AI0N37jKk

On 11/14/2016 06:40 PM, Alex Bennée wrote:
> We have never has the concept of global TLB entries which would avoid
> the flush so we never actually use this flag. Drop it and make clear
> that tlb_flush is the sledge-hammer it has always been.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
