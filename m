Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2818695ejm;
        Wed, 3 May 2023 06:01:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lRykOoj/KD1iSm5NlYCLgYXI/cKNr8I9VaQDo10TrXs+eWc8J4MIG+wnH1HdShtjm+63j
X-Received: by 2002:adf:db4f:0:b0:2f9:a798:602c with SMTP id f15-20020adfdb4f000000b002f9a798602cmr34381wrj.12.1683118873910;
        Wed, 03 May 2023 06:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683118873; cv=none;
        d=google.com; s=arc-20160816;
        b=KKlx/OSKjxzuVL7ZanyoNe1fIK+g2XnsRiisBWnfB9QsEmFMaM9rabopdOHLVtUJBx
         Zn6rPXmOv87CNxlTCymoNnWGdpqZLfedKCA9FF+zpNCwaR9m4qIw5lf7RwcgPm87alBb
         zue06LnJfXSU0EfCE/IKlwvIcShLnPzV6caT1VqS25MAUXBYiiloUZXYB8Z4DDuaF5xE
         3CVCoCZYS8JXyD4JsyrE4Oh5Nw5gBxkad2skGnwOW3/aJ3Dx1CYnzA+ahV5VxgW5ExfC
         Mz2CiQVBonOk+PeZHy3d9VRqtEOFZ9IP5B9c62rIZRC3jh+z/ZabwClESBEwjTKPdUoV
         QpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=AamY8doazuuSB2XXOx/A5+uLkbEsYAPZOmIMtzbPY0k=;
        b=jQ7QyUHVykdVzupzMQPnrO7XPwk674AIcxHBM0rRMpEuschJbiqLhdc5LVdfXut4AC
         9aBZUTIdQcWmAVKUpOapOt40x0BRcSlWQjQZNqznXEVExSTn70h19m04C6IntIYX2GcI
         QKIn3gmaiWvk0N8iQYMrmOf5C4MqTf+K5rYjhnPglo2hSIPCqkuTmdzKwcirotOVTF/E
         I8+qrFOlrlqBLyS8vEhfOVHwIziF5AAXJKC1gtoscinUv4YcJDB1dOscrYL1P/Gw7YTY
         yPzjT5CMjVh004qLs56vMAlnijQrbdmR8JLTOWotWdSChsNQ85xiZrJfIG+Ua4XbZj/6
         KGvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cjtKlq8H;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id m11-20020adfe94b000000b003063afded8bsi1983206wrn.347.2023.05.03.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 06:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cjtKlq8H;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B70A2190B;
	Wed,  3 May 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683118873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AamY8doazuuSB2XXOx/A5+uLkbEsYAPZOmIMtzbPY0k=;
	b=cjtKlq8HlQRaWYlzDdVxRmp5nUBUB2pP5/UD/8mITOQwGSHKcVYYzRwluQYHt2T849cqc6
	aWWH6ML5Y5iQGNgMg5/DaS7RxR0jmAI1l6VDuyNDv5st5rjrS6ZhinK1LJqu/00Axx97K4
	+f2AdLZop26m3XaIyx8RSNSDNY24eb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683118873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AamY8doazuuSB2XXOx/A5+uLkbEsYAPZOmIMtzbPY0k=;
	b=h+INhXXqUGj9yWLZ3lMHWzfY+XGth9XgUpdElD/1ZEM4y0+uV9NfM1J36sXf8GE9YMkEZ4
	YYEYIrCDYERspHDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96C1613584;
	Wed,  3 May 2023 13:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id P2eyJBhbUmTBEQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 03 May 2023 13:01:12 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal
 <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 20/22] gitlab: enable minimal device profoile for
 aarch64 --disable-tcg
In-Reply-To: <20230503091244.1450613-21-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-21-alex.bennee@linaro.org>
Date: Wed, 03 May 2023 10:01:10 -0300
Message-ID: <87354dzi09.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dYDIgwsum75W

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> As this is likely the most common configuration people will want once
> the --disable-tcg patches land.

I don't think sbsa-ref works with KVM, sbsa_ref_init has:

    if (kvm_enabled()) {
        error_report("sbsa-ref: KVM is not supported for this machine");
        exit(1);
    }
