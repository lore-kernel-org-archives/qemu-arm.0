Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B864606A339
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qs+WuZSx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT1tb-0005SQ-GH; Mon, 16 Nov 2026 13:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1ta-0005OK-3q
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 13:57:38 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1tX-0006Li-Bh
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 13:57:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4a34ffd3e39so128773f8f.0
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 10:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794855453; x=1795460253; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RIC6/AdPDOweSTfySBAr8bYI/5fnqpqzSYxDbZyga2Y=;
 b=qs+WuZSxAMf0tMrjoRUrewh0DBhkMTKMnOOiKmoK7Iz6bI/p2kWPsi6UtMzVITYhnL
 TdFbR4UXk8KLV5Lr/kkDrX5/CLqgKUwzY0V3UjgatPxfQelCfqPS/Mcu0At8wE6c03DR
 AL3hRkzMLY2yQV0UcvljFzwQFafaY3qyth3dF9bpqABGsXK9FWzKtWkvEZpiIp4IzG7X
 NXwNATf8mcUsbCjVspEVZ2zcw5F3j3riAGvDsCuSjDVd3KJrzLmP+E+5pSQHQuMHpx3N
 Xx+GY2WrRjMWIi7N6JKJrE+RAUBKttncHRsOawtSeorYORYeFmNnk6MaCcaEYraoGK3H
 XBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794855453; x=1795460253;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RIC6/AdPDOweSTfySBAr8bYI/5fnqpqzSYxDbZyga2Y=;
 b=Q6pdda72Kv/37uXHDQ8bdAo3N2F/bPSsioJjn2QlYddmqBjTGCi1uBS5SZXPP9elVc
 Uw+n49te73cs/e2xoh7ez8lKdah7gzUSCTb2PMe5ZoVTU/lkFqI/F4h2B25MfTNUU0mS
 3xyCE1IpI4Fxh7+jgmwlYyXXW9C+4JFxK0jwcpZvSXrPWdReifc3eNr0ItHQnOllCsva
 cJpKL5Lh+RGPovbWkfNGFAvNe1OjF2BMPUZjJNNqW9VtIfG6phtFr7NK69V+v+qPOJdW
 yehH8+owBmU6IknzXcZ2nAg281VKWEAm8dfa+Wms55CMPIb6PgsDMzBEfQxlqR0LWWJF
 muJg==
X-Forwarded-Encrypted: i=1;
 AL+hErGjeZhWikNfmjqd0n/BZvnncWDvKcJFJGIp4hCXhObK4LdNpombxkFQLZi+gf6UOz5BDrVKyQ7EyQ==@nongnu.org
X-Gm-Message-State: APuU4Z/l7DlRNAMoPL4lk+sjSN2UhxDKkAZmJCp7zdXBjngMIEZrALFS
 UotFB8yA7Lx5odkLZxqE2kcqiMJ8kL6OnGipLfWv/qvbe5XvVvkUhwl4c6BvE149TnE=
X-Gm-Gg: AZFdTZfP+vYyE9NhAkZ8D8G4HTQPwKSVVlhEePCB7sV8oDtyqWB7whxjWYBTd+lwv2b
 zYnPiigHQVDZ3V9GOlZ0qD/GTxCfuZs3L5q86lnx7c8Rpno7kabmfQ0cg9lj0hXl20xOUZGhvGh
 OdnG9Gl3uygABN/A3WCps67nmgNRFE/1e+iLALBI0AWPH6hSpH3tIfUHQyHL3gpMvXiKwL0zV7Y
 roCTSR238K1cxykdrO8XSdCy3YCuKX7AiVo8V4TvZ91A3XKbIlhDM/1mIrdeQ8GfjgWxjSY+u94
 DY1YPMs+W/X5F0uqVM50y4I/Sz0Wjo1/MCb/91/Lj7f2UY+/SASyffvzePjr7bCAiiRfBbs3C5u
 azPoZxrTlKUcwMGdKmcK4H8ZP1tF4qAa2wnhLdnN2iPnrnaonhxANYKxZh3OhiVjoIvvBbDHK4Z
 ekBauqmxggHJ8m73+jn4us78Wza2UFhG9kWEQ+yDgrFvBXwtskuZGvw8QNTTj+uI0MnrcxKiu50
 FJGTFP875ttW8OnuUuMQINuBhNvw8vJ8IqPzMQ1UsSDATU4vSpPe6Sq9GitkzSgAXoeEBsojiyv
 rMIbnPrrmC7k7QvB8Jw8/Ydr7OIJ
X-Received: by 2002:a05:6000:4024:b0:490:d197:bde8 with SMTP id
 ffacd0b85a97d-49c6b972aedmr28472431f8f.0.1794855453450; 
 Mon, 16 Nov 2026 10:57:33 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm19789038f8f.20.2026.11.16.10.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 10:57:32 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8EB6F5F8FE;
 Mon, 16 Nov 2026 18:57:31 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org,
 Junjie Cao <junjie.cao@intel.com>
Subject: Re: [PATCH v2 28/28] hw/usb: mark UHCI, OCHI & ECHI USB hosts as
 secure
In-Reply-To: <1711cf10-2719-4d6a-93f2-b7a3a7554ecb@redhat.com> (Thomas Huth's
 message of "Fri, 6 Nov 2026 13:28:18 +0100")
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-29-berrange@redhat.com>
 <1711cf10-2719-4d6a-93f2-b7a3a7554ecb@redhat.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Mon, 16 Nov 2026 18:57:31 +0000
Message-ID: <87zev8ioys.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thomas Huth <thuth@redhat.com> writes:

> On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
>> Modern virtualized guests are expected to be deployed with the
>> XHCI controller which supports all of USB 1, 2 and 3. The UHCI
>> OCHI and ECHI hosts, however, have all been widely used in
>> virtualization scenarios historically, especially on x86. Indeed
>> the -usb flag will enable UCHI by default.
>> So while these are undesirable hosts in general, this marks them
>> as secure for virtualization use cases.
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>   hw/usb/hcd-ehci-pci.c    | 1 +
>>   hw/usb/hcd-ehci-sysbus.c | 7 +++++++
>>   hw/usb/hcd-ohci-pci.c    | 1 +
>>   hw/usb/hcd-ohci-sysbus.c | 1 +
>>   hw/usb/hcd-uhci.c        | 1 +
>>   5 files changed, 11 insertions(+)
> I'd also rather drop this patch until we've got a proper USB
> maintainer again. Otherwise we promise that these devices are secure,
> but nobody really takes care of security related issues in the end.
> (It's already exhausting enough to get XHCI into a proper shape again)
>

+1 - it's not like users can't use USB but the warning from failing with
secure will at least make them go in with eyes open/look for
alternatives.

>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

