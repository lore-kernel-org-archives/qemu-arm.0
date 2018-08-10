Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2595549wru;
        Thu, 9 Aug 2018 20:32:04 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwi8A7W6X3HTZI+JIi5c8+gBFozeWTBDIKtO/1unwFYS1DXVetlRgqQm/1p9w/x1eZ141yk
X-Received: by 2002:a37:3609:: with SMTP id d9-v6mr4133658qka.419.1533871923972;
        Thu, 09 Aug 2018 20:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533871923; cv=none;
        d=google.com; s=arc-20160816;
        b=s7wEJ4fhgyCybU1Zf80Cq+d903QcbP2q7D3pEB3s9cwEWtH5pi8Fl4PXYUbtb/q9Dc
         NVyUbAdtxkkj8eE96ixcWZn0kyiHpLSf1rZHrEjYv/7T9HQ0EjwiSRx5YmVxO4OmR/zQ
         f9Io50Rg7w0S13QgsqPljTkFXvz/qcCMyGDLXGPZHWn7H19VhNCaIFaDCis9XI15ncuy
         0PBQw6AUo1PKf81Fn9h/Vb+Re2cNa15iEYTtXUKxqsKmMDwZnzI8/S6A404zMGxGEdYH
         v/Tfr5rY4gUE4YRqLNDTLtRBfLgoJiqFYmnUGkC1cZ28EsTon9Z+j+UB2Fpn+/vcJURI
         Idjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=W6iQ4xl3cJLdy8Ehiv1SNtxteKxbla1thzYmVTyN9dw=;
        b=KvwlcuIDox7d/fUhGOQoh4ChVX1DOqHJtvNGNt4bFhUcWSV3kK9XXZNvI1rMlXve4O
         26/bv2IYKJDA4nuplNoI85hwUVBm5hHASDFPQ41kRX+eabciD6crz8x/qXNyoUCKrmon
         dXOvqnMZuREpL8VKdH8SmGxVRcGlRUfL8c6khvGYr1+6TC04f8+UkB+xNfHvhuVsOfTn
         ydh2aV8+8irAOOErIU8SO1xIy75KAxa/4fDf/Vw/PZYppyshV9j2SagK+UDRS/lWtPWO
         frYdowWGYcu+rYYtcBskkwCvHqzpjyhq3cHelX2h91tXC3oNEbsehSO7/i0m+gStSJa5
         JOPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <ehabkost@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f132-v6si8154782qkb.43.2018.08.09.20.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Aug 2018 20:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C3E830832E7;
	Fri, 10 Aug 2018 03:32:02 +0000 (UTC)
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FEBF61356;
	Fri, 10 Aug 2018 03:32:01 +0000 (UTC)
Date: Fri, 10 Aug 2018 00:32:00 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	richard.henderson@linaro.org, Cleber Rosa <crosa@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH 1/4] scripts/decodetree.py: add a
 disassembly generator (HACK!)
Message-ID: <20180810033200.GA8773@localhost.localdomain>
References: <20180808123934.17450-1-alex.bennee@linaro.org>
 <20180808123934.17450-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180808123934.17450-2-alex.bennee@linaro.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 10 Aug 2018 03:32:02 +0000 (UTC)
X-TUID: ohdZbMVlEia9

On Wed, Aug 08, 2018 at 01:39:31PM +0100, Alex Bennée wrote:
> Given our issues with failing disassembly we could try and re-use the
> decode tree data to output what instruction is being decoded. This
> will be used if registered as a fall-back for when the "proper"
> disassembler fails to decode an instruction.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I don't have an opinion on the approach you are taking, but the
Python code you are adding is consistent with the existing style
of the script.

That said, I find the existing code full of output() calls very
hard to read.  If anybody wants to volunteer to improve the
readability of the output generation, it would be welcome.

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
