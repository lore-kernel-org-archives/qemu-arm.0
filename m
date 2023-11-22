Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp451132ejx;
        Wed, 22 Nov 2023 08:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMYdMJk20aBPBlJT1mJF46sXV4BomLixj+v6fd5QItkSMNlRI4V9ElsbR99ZP0rCbH1ijh
X-Received: by 2002:a1f:6284:0:b0:4af:fd28:975 with SMTP id w126-20020a1f6284000000b004affd280975mr3211198vkb.5.1700670649753;
        Wed, 22 Nov 2023 08:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700670649; cv=none;
        d=google.com; s=arc-20160816;
        b=esW5j6WvcqNdmHfQ12mj3/6hYu2Av7YUIZmyr9MIiJEiA1m4lCDiJug3ABEOfXPxJI
         zpeqU0fcS9y4HlWd61tFoKQB/XdJ6KCkFoKeb4KiLX9WK0vu+vH9ROG7riB63Cew2H2q
         n4xiH2hq9AbYH/0cQ3OqGdS3b3VsCZcxfH2mv5lYv3xZlAFjwLxze5Um6juJkVVVBwjB
         UwMfXS4dw8Yx0zRVxt6/bWZRKuvi5w3VytVTsfySgv/F6SevKQadTX45GfGfvgxc+i4q
         EKbMSTkbixkFkJ4YaELNSOGnOFSsM9pk9zTP4s7Z3Eh3dMPIVUQqkbhEWJG2rtbL/Zm7
         /4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JF0Z1k/2QhltBjvoo/3A69boZrm7eAUB3hK32VTyTj0=;
        fh=u1OL3lTxKNcHh3ZqJ4jjdO7Qp3gj9LMM8m5qOmodkrY=;
        b=nBpxnklaZBhIe1SmLDo7DuMRj2XnRpMdt+4G8yHpwi5R5xQ/U+MbvWZvPFzjoQJLWx
         kTjtKasVMMNWrqHnLQMKccz9i+Krt75jUePFQhaafSYZOwvXiD9dateRZZx1aoNfXAyW
         K/MsMtquw3JlfpGCv7RMLXoF7CYmAmH9B2Ct6JrzQ7PIU4w3t6N3HSuFKqw0UfOKx1RD
         DqXnX7I85QQ9DASfpJAyIJsYM/ocp/7bbW/5WuckOy6laxJH75O+55Jc/r978E8OeuWV
         HM9hXvT1i5hWyibGQi8GcA6oDGcLKRVCA8f9mQLGBr7On41yXKfbuCwIc/RoB6kC37ZO
         //7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F++yCkG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v62-20020a1fc541000000b0048c1cc740ebsi2827004vkf.178.2023.11.22.08.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 08:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F++yCkG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5q7b-0005Qc-VP; Wed, 22 Nov 2023 11:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r5q7Z-0005PT-0G
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 11:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r5q7X-0005UU-0G
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 11:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700670633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JF0Z1k/2QhltBjvoo/3A69boZrm7eAUB3hK32VTyTj0=;
 b=F++yCkG8GwK2kPUg+70I+/DsM6NrEhJqsqm2BPdHvNlYptdJnrBKgfZXKL2mQESGwzwb2m
 NgcyPNccX6AI5qCbs3xdbFioPkZFfutjTBfjQq2u1bggl2ya1Iob3JN952pbwxtimoJJ7Z
 SNRgVz/5Pyc/LMBtj7wDZNkuYlCwYbo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-eVNTe0QXM5apCRItOQqxrw-1; Wed,
 22 Nov 2023 11:30:28 -0500
X-MC-Unique: eVNTe0QXM5apCRItOQqxrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D466C1C0140B;
 Wed, 22 Nov 2023 16:30:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3CD1121306;
 Wed, 22 Nov 2023 16:30:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E0611800394; Wed, 22 Nov 2023 17:30:21 +0100 (CET)
Date: Wed, 22 Nov 2023 17:30:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, graf@amazon.com, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 05/16] hw/uefi: add var-service-core.c
Message-ID: <asxz5xxm5yjrwamdpqglseayy6q2uy24gpwf6pp26ged2ynt7k@g3nvpumuen5c>
References: <20231115151242.184645-1-kraxel@redhat.com>
 <20231115151242.184645-6-kraxel@redhat.com>
 <f3794048-d8b9-7f53-d191-3ffbe75cee82@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3794048-d8b9-7f53-d191-3ffbe75cee82@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.058,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FfjQ7rDEiIhH

  Hi,

> - in general, we should filter out surrogate code points, for any use.
> any UCS2 string from the guest that contains a surrogate code point
> should be considered invalid, and the request should be rejected based
> just on that.

Something like this?

edk2 seems to be inconsistent with strings, sometimes they are expected
to include a terminating '\0' char (most of the time), sometimes not
(in variable policies for example).

gboolean uefi_str_is_valid(const uint16_t *str, size_t len,
                           gboolean must_be_null_terminated)
{
    size_t pos = 0;

    for (;;) {
        if (pos == len) {
            if (must_be_null_terminated) {
                return false;
            } else {
                return true;
            }
        }
        switch (str[pos]) {
        case 0:
            /* end of string */
            return true;
            ;;
        case 0xd800 ... 0xdfff:
            /* outlaw surrogates */
            return false;
        default:
            /* char is good, check next */
            break;
        }
        pos++;
    }
}

take care,
  Gerd

